from NLP.iocNer import *
from NLP.reportPreprocess import *
from attackTemplate import *

import networkx as nx
import graphviz
import re
from nltk import Tree
import matplotlib.pyplot as plt
import logging
import sys
import os


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


def view_graph(g: nx.DiGraph, image_file: str = None):
    graph_pos = nx.spring_layout(g)
    nx.draw_networkx_nodes(g, graph_pos, node_size=10, node_color='blue', alpha=0.3)
    nx.draw_networkx_edges(g, graph_pos)
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


def draw_attackgraph(g: nx.DiGraph, clusters: dict = None, output_file: str = None) -> graphviz.Graph:
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
        dot.render(output_file, view=False)

    return dot


class AttackGraph:
    AG: nx.DiGraph

    nodes = {}  # node representation -> confidence score
    edges = {}  # (node_a, node_b) -> confidence score

    techniques = {}  # technique name -> [node_list]

    def AG_matching(m: dict, n: dict) -> float:
        similarity = 0.0

        return similarity

    def extract_entity_list_from_spacydoc(self, doc):
        logging.info("---Extract Entity List!---")
        ent_list = []

        for ent in doc.ents:
            ent = ent[0]
            if ent.ent_type_ in ner_labels:
                n = "@".join([ent.text, ent.ent_type_])
                logging.debug(n)
                ent_list.append(n)

        return ent_list

    def construct_AG_from_spacydoc(self, doc, G=None):
        for sentence in doc.sents:
            try:
                G = self.construct_AG_from_spacysent(sentence, G)
            except:
                continue

        return G

    def construct_AG_from_spacysent(self, sentence, G=None):
        logging.info("---Construct Attack Graph!---")

        if G == None:
            G = nx.DiGraph()

        node_queue = []
        tvb = ""
        tnode = ""

        root = sentence.root
        # to_nltk_formatted_tree(root).pretty_print()

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
                    n = "@".join([node.text, node.ent_type_])
                    logging.debug(n)
                    G.add_node(n, type=node.ent_type_, nlp=node.text)

                    if tnode != "" and tvb != "":
                        G.add_edge(tnode, n, action=tvb)
                    tnode = n
            for child in node.children:
                node_queue.append(child)

        return G


# %%

if __name__ == '__main__':
    logging.basicConfig(stream=sys.stdout, level=logging.INFO)

    ner_model = IoCNer("./new_cti.model")
    ag = AttackGraph()

    # %%

    # sample = "APT12 has sent emails with malicious Microsoft Office documents and PDFs attached."
    # sample = "APT3 has used PowerShell on victim systems to download and run payloads after exploitation."
    # sample = "Sandworm Team has delivered malicious Microsoft Office attachments via spearphishing."
    # sample = "Windshift has sent spearphishing emails with attachment to harvest credentials and deliver malware."
    #
    # doc = ner_model.parser(sample)
    # G = ag.construct_AG_from_spacydoc(doc)

    # %%

    # file = r"C:\Users\xiaowan\Documents\GitHub\AttacKG\data\cti\html\0a84e7a880901bd265439bd57da61c5d.html"
    # text = read_html(file)
    #
    # doc = ner_model.parser(text)
    # G = ag.construct_AG_from_spacydoc(doc)
    # ent_list = ag.extract_entity_list_from_spacydoc(doc)

    # %%

    cti_path = r"C:\Users\xiaowan\Documents\GitHub\AttacKG\data\cti\html"
    output_path = r"C:\Users\xiaowan\Documents\GitHub\AttacKG\data\processed"

    cti_files = os.listdir(cti_path)
    for file in cti_files:
        file_name = os.path.splitext(file)[0]
        file_ext = os.path.splitext(file)[-1]
        if file_ext == ".html":
            logging.info("---Parsing %s!---" % file)

            text = read_html(os.path.join(cti_path, file))
            if len(text) > 1000000:
                continue
            doc = ner_model.parser(text)

            g = ag.construct_AG_from_spacydoc(doc)
            nx.write_gml(g, os.path.join(output_path, file_name + ".gml"))
            # view_graph(g)
            # view_graph(g, os.path.join(output_path, file_name + ".png"))
            dot = draw_attackgraph(g, output_file=os.path.join(output_path, file_name))
            # dot.view()

    # %%

    # view_graph(G)

    # %%

    # nx.write_gml(G, os.path.basename(file).split('.')[0] + '.gml')

    # %%

    # techniques = {
    #     "Scripting": ['script@ExeFile'],
    #     "Scripting": ['PowerShell@ExeFile'],
    #     "Phishing E-mails": ['actors@APTFamily', 'documents@DocumentFile', 'email@NetLoc']
    # }
    #
    # dot = AttacKG_AG.draw_AG(G, clusters=techniques)
    # dot.view()
