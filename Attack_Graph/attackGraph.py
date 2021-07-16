import spacy.tokens

from NLP.iocNer import *
from NLP.iocRegex import *
from NLP.reportPreprocess import *
from Mitre_TTPs.mitre_graph_reader import *
# from attackTemplate import *

import networkx as nx
import graphviz
import re
from nltk import Tree
import matplotlib.pyplot as plt
import logging
import sys
import os
import spacy
import itertools
import coreferee


def to_nltk_tree(node):
    if node.n_lefts + node.n_rights > 0:
        return Tree(node.orth_, [to_nltk_tree(child) for child in node.children])
    else:
        return node.orth_


def tok_format(tok):
    return "@".join([tok.orth_, tok.tag_, tok.dep_, tok.ent_type_])  # , tok.dep_])


def to_nltk_formatted_tree(node):
    if node.n_lefts + node.n_rights > 0:
        return Tree(tok_format(node), [to_nltk_formatted_tree(child) for child in node.children])
    else:
        return tok_format(node)


# draw attack graph with matplot
def draw_attackgraph_plt(nx_graph: nx.DiGraph, image_file: str = None):
    graph_pos = nx.spring_layout(nx_graph)
    nx.draw_networkx_nodes(nx_graph, graph_pos, node_size=10, node_color='blue', alpha=0.3)
    nx.draw_networkx_edges(nx_graph, graph_pos)
    # nx.draw_networkx_labels(g, graph_pos, font_size=8, font_family='sans-serif')
    # edge_labels = nx.get_edge_attributes(G, 'action')
    # nx.draw_networkx_edge_labels(G, graph_pos, edge_labels=edge_labels)

    if image_file is None:
        plt.show()
    else:
        plt.savefig(image_file)


# https://graphviz.org/doc/info/shapes.html
node_shape = {
    "NetLoc": "diamond",
    "E-mail": "diamond",
    "C2C": "diamond",
    "APTFamily": "doublecircle",
    "ExeFile": "oval",
    "ScriptsFile": "oval",
    "DocumentFile": "rectangle",
    "File": "rectangle",
    "Registry": "parallelogram",
    "Vulnerability": "trapezium",
    "Service": "trapezium",
    "SensInfo": "invhouse"
}


def draw_attackgraph_dot(g: nx.DiGraph, clusters: dict = None, output_file: str = None) -> graphviz.Graph:
    dot = graphviz.Graph('G', filename=output_file)

    for node in g.nodes:
        logging.debug(node)

        nlp = ""
        regex = ""
        try:
            nlp = g.nodes[node]["nlp"]
        except:
            pass

        try:
            regex = g.nodes[node]["regex"]
        except:
            pass
        node_label = "\n-\n".join([nlp, regex])

        dot.node(node, label=node_label, shape=node_shape[g.nodes[node]["type"]])

    for edge in g.edges:
        dot.edge(edge[0], edge[1])

    # https://graphviz.readthedocs.io/en/stable/examples.html
    if clusters is not None:
        for key, value in clusters.items():
            with dot.subgraph(name=("cluster_" + key)) as t:
                t.attr(style='filled', color='lightgrey')
                t.attr(label=key)
                for tech in value:
                    t.node(tech)

    if output_file is not None:
        dot.format = "png"
        try:
            dot.render(output_file, view=False)
        except:
            logging.warning("%s dot rendering error!")

    return dot


# def extract_entity_list_from_spacydoc(nlp_doc):
#     logging.info("---Extract Entity List!---")
#     ent_list = []
#
#     for ent in nlp_doc.ents:
#         ent = ent[0]
#         if ent.ent_type_ in ner_labels:
#             n = "@".join([ent.text, ent.ent_type_])
#             logging.debug(n)
#             ent_list.append(n)
#
#     return ent_list

class AttackGraphNode:
    node_type = ""
    node_ioc_representation = ""
    node_nlp_representation = ""

    def __init__(self, node_type):
        self.node_type = node_type

    def __str__(self):
        return "#".join(self.node_type, self.node_nlp_representation, self.node_ioc_representation)


class AttackGraph:
    attackgraph_nx: nx.DiGraph
    nlp_doc: spacy.tokens.doc.Doc

    node_list = []
    edge_list = []

    techniques = {}  # technique name -> [node_list]

    def __init__(self):
        self.attackgraph_nx = None

    def __init__(self, doc):
        self.attackgraph_nx = None
        self.nlp_doc = doc

    def construct_nxgraph_from_spacydoc(self, doc):
        for sentence in doc.sents:
            try:
                self.attackgraph_nx = self.construct_nxgraph_from_spacysent(sentence)
            except:
                continue

        return self.attackgraph_nx

    # construct graph with spacy tree
    def construct_nxgraph_from_spacysent(self, sentence):
        logging.info("---Construct Attack Graph!---")

        if self.attackgraph_nx == None:
            self.attackgraph_nx = nx.DiGraph()

        node_queue = []
        tvb = ""
        tnode = ""

        root = sentence.root
        # to_nltk_formatted_tree(root).pretty_print()
        is_related_sentence = False

        # FIXME: Wrong relationships
        # traverse the nltk tree
        node_queue.append(root)
        while node_queue:
            node = node_queue.pop(0)  # FIXME: First in first out
            # print("@".join([node.text, node.tag_, node.ent_type_]))
            if re.match("VB.*", node.tag_):
                tvb = node.text
            if re.match("NN.*", node.tag_):
                # if node.ent_type_ != "":
                if node.ent_type_ in ner_labels:
                    is_related_sentence = True

                    n = "@".join([node.text, node.ent_type_])
                    logging.debug(n)
                    self.attackgraph_nx.add_node(n, type=node.ent_type_, nlp=node.text)

                    if tnode != "" and tvb != "":
                        self.attackgraph_nx.add_edge(tnode, n, action=tvb)
                    tnode = n
            for child in node.children:
                node_queue.append(child)

        if(is_related_sentence):
            logging.info("Related sentence: %s" % sentence.text)

        return self.attackgraph_nx

    def parse(self):
        logging.info("---S1-1: Parsing NLP doc to get Attack Graph!---")

        # parse node
        self.parse_node()
        # parse edge
        self.parse_edge()
        # parse coreference
        self.parse_coreference()

    def parse_node(self):
        logging.info("---S1-1.1: Parsing NLP doc to get Attack Graph Nodes!---")
        pass

    # M1: find Shortest Dependency Path (SDP)
    # https://towardsdatascience.com/how-to-find-shortest-dependency-path-with-spacy-and-stanfordnlp-539d45d28239
    def parse_edge(self):
        logging.info("---S1-1.2: Parsing NLP doc to get Attack Graph Edges!---")

        edges = []
        ioc_nodes = []
        for token in doc:
            if token.ent_type_ in ner_labels:
                ioc_nodes.append(token.lower_)

            for child in token.children:
                edges.append((
                    '{0}'.format(token.lower_),
                    '{0}'.format(child.lower_)))

        nlp_tree = nx.Graph(edges)
        draw_attackgraph_plt(nlp_tree)

        for nodes in range(2, nlp_tree.number_of_nodes()):
            for SG in (nlp_tree.subgraph(selected_nodes) for selected_nodes in itertools.combinations(nlp_tree, nodes)):
                if nx.is_connected(SG):
                    print(SG.nodes)

        # picked_edges = []
        # for n in ioc_nodes:
        #     for m in ioc_nodes:
        #         try:
        #             print(nx.shortest_path_length(nlp_tree, source=n, target=m))
        #             print(nx.shortest_path(nlp_tree, source=n, target=m))
        #             picked_edges.append((m, n))
        #         except:
        #             continue
        #
        # graph = nx.Graph(picked_edges)
        # draw_attackgraph_plt(graph)

    def parse_coreference(self):
        logging.info("---S1-1.3: Parsing NLP doc for co-reference!---")
        pass

    def to_node_sequence(self):
        pass # TODO


def parse_attackgraph_from_cti_report(cti_file: str = r".\data\cti\html\0a84e7a880901bd265439bd57da61c5d.html", output_path: str = ""):
    logging.info("---Parsing %s---" % cti_file)

    file_name = os.path.splitext(cti_file)[0]
    file_ext = os.path.splitext(cti_file)[-1]
    if file_ext == ".html":
        text = read_html(cti_file)
        if len(text) > 1000000:  # FIXME: cannot process text file with more than 1000000 characters.
            logging.warning("---Not support too long CTI reports yet!---")
            return
    else:
        logging.warning("---Not support non-html CTI reports yet!---")
        return

    iid = IoCIdentifier(text)
    iid.display_iocs()
    text_without_ioc = iid.replaced_text

    doc = ner_model.parser(text_without_ioc)
    ag = AttackGraph(doc)

    # ag.parse_edge()

    ag.construct_nxgraph_from_spacydoc(doc)
    dot_graph = draw_attackgraph_dot(ag.attackgraph_nx)

    if output_path == "":
        dot_graph.view()
    else:
        nx.write_gml(ag.attackgraph_nx, os.path.join(output_path, file_name + ".gml"))
        draw_attackgraph_dot(ag.attackgraph_nx, output_file=os.path.join(output_path, file_name))

# %%

if __name__ == '__main__':
    logging.basicConfig(stream=sys.stdout, level=logging.INFO)

    ner_model = IoCNer("./new_cti.model")
    ner_model.add_coreference()

    # parse_attackgraph_from_cti_report()

    cti_file = r".\data\cti\html\0a84e7a880901bd265439bd57da61c5d.html"
    text = read_html(cti_file)

    iid = IoCIdentifier(text)
    iid.display_iocs()
    text_without_ioc = iid.replaced_text

    doc = ner_model.parser(text_without_ioc)
    ag = AttackGraph(doc)
    ag.parse()
    ag.construct_nxgraph_from_spacydoc(doc)
    dot_graph = draw_attackgraph_dot(ag.attackgraph_nx)

    ag.nlp_doc._.coref_chains.print()
    dot_graph.view()

    # %%
    # class AttackGraph unit test

    # cti_path = r".\data\cti\html"
    # output_path = r".\data\extracted_attackgraph"
    #
    # cti_files = os.listdir(cti_path)
    # for file in cti_files:
    #     parse_attackgraph_from_cti_report(os.path.join(cti_path, file), output_path)

    # %%
    # draw_AG() unit test

    # techniques = {
    #     "Scripting": ['script@ExeFile'],
    #     "Scripting": ['PowerShell@ExeFile'],
    #     "Phishing E-mails": ['actors@APTFamily', 'documents@DocumentFile', 'email@NetLoc']
    # }
    #
    # dot = AttacKG_AG.draw_AG(G, clusters=techniques)
    # dot.view()

    # %%
    # construct_AG_from_spacydoc() unit

    # sample = "APT12 has sent emails with malicious Microsoft Office documents and PDFs attached."
    # sample = "APT3 has used PowerShell on victim systems to download and run payloads after exploitation."
    # sample = "Sandworm Team has delivered malicious Microsoft Office attachments via spearphishing."
    # sample = "Windshift has sent spearphishing emails with attachment to harvest credentials and deliver malware."
    #
    # doc = ner_model.parser(sample)
    # G = ag.construct_AG_from_spacydoc(doc)
