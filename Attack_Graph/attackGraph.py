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
from pathlib import Path


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
    nx.draw_networkx_labels(nx_graph, graph_pos, font_size=8, font_family='sans-serif')
    edge_labels = nx.get_edge_attributes(nx_graph, 'action')
    nx.draw_networkx_edge_labels(nx_graph, graph_pos, edge_labels=edge_labels)

    if image_file is None:
        plt.show()
    else:
        plt.savefig(image_file)


# https://graphviz.org/doc/info/shapes.html
# node_shape = {
#     "NetLoc": "diamond",
#     "E-mail": "diamond",
#     "C2C": "diamond",
#     "APTFamily": "doublecircle",
#     "ExeFile": "oval",
#     "ScriptsFile": "oval",
#     "DocumentFile": "rectangle",
#     "File": "rectangle",
#     "Registry": "parallelogram",
#     "Vulnerability": "trapezium",
#     "Service": "trapezium",
#     "SensInfo": "invhouse"
# }

node_shape = {
    "actor": "doublecircle",
    "network": "diamond",
    "executable": "oval",
    "file": "rectangle",
    "defender": "invhouse",
    "registry": "parallelogram",
    "vulnerability": "trapezium",
    "system": "trapezium"
}


def draw_attackgraph_dot(g: nx.DiGraph, clusters: dict = None, output_file: str = None) -> graphviz.Graph:
    dot = graphviz.Digraph('G', filename=output_file)

    logging.warning("---Draw attack graph with dot!---")

    for node in g.nodes:
        logging.debug(node)

        nlp = ""
        try:
            nlp = g.nodes[node]["nlp"]
        except:
            pass

        regex = ""
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
    node_type: str
    node_ioc_representation: str
    node_nlp_representation: str

    def __init__(self, node_type):
        self.node_type = node_type

    def __str__(self):
        return "#".join(self.node_type, self.node_nlp_representation, self.node_ioc_representation)


# return token unique id for nx.graph
def get_token_id(tok: spacy.tokens.token.Token) -> str:
    # return "@".join([tok.lower_, tok.ent_type_])
    return "#".join([tok.lower_, tok.ent_type_, str(tok.i)])


class AttackGraph:
    attackgraph_nx: nx.DiGraph
    nlp_doc: spacy.tokens.doc.Doc
    ioc_identifier: IoCIdentifier

    node_list: list
    edge_list: list

    ioc_coref_list: list
    ioc_coref_dict: dict

    # attack_node_list: list
    entity_root_token_string_dict: dict
    entity_ignore_token_list: list

    techniques = {}  # technique name -> [node_list]

    # def __init__(self, ioc_identifier = None):
    #     self.attackgraph_nx = None
    #     self.ioc_identifier = ioc_identifier
    #
    #     self.ioc_coref_list = []
    #     self.ioc_coref_dict = {}

    def __init__(self, doc, ioc_identifier = None):
        self.attackgraph_nx = None
        self.ioc_identifier = ioc_identifier

        self.ioc_coref_list = []
        self.ioc_coref_dict = {}

        self.entity_root_token_string_dict = {}
        self.entity_ignore_token_list = []

        self.nlp_doc = doc

    # def construct_nxgraph_from_spacydoc(self, doc):
    #     for sentence in doc.sents:
    #         try:
    #             self.attackgraph_nx = self.construct_nxgraph_from_spacysent(sentence)
    #         except:
    #             continue
    #
    #     return self.attackgraph_nx
    #
    # # construct graph with spacy tree
    # def construct_nxgraph_from_spacysent(self, sentence):
    #     logging.info("---Construct Attack Graph!---")
    #
    #     if self.attackgraph_nx == None:
    #         self.attackgraph_nx = nx.DiGraph()
    #
    #     node_queue = []
    #     tvb = ""
    #     tnode = ""
    #
    #     root = sentence.root
    #     # to_nltk_formatted_tree(root).pretty_print()
    #     is_related_sentence = False
    #
    #     # FIXME: Wrong relationships
    #     # traverse the nltk tree
    #     node_queue.append(root)
    #     while node_queue:
    #         node = node_queue.pop(0)
    #         # print("@".join([node.text, node.tag_, node.ent_type_]))
    #         if re.match("VB.*", node.tag_):
    #             tvb = node.text
    #         if re.match("NN.*", node.tag_):
    #             # if node.ent_type_ != "":
    #             if node.ent_type_ in ner_labels:
    #                 is_related_sentence = True
    #
    #                 n = "@".join([node.text, node.ent_type_])
    #                 logging.debug(n)
    #                 self.attackgraph_nx.add_node(n, type=node.ent_type_, nlp=node.text)
    #
    #                 if tnode != "" and tvb != "":
    #                     self.attackgraph_nx.add_edge(tnode, n, action=tvb)
    #                 tnode = n
    #         for child in node.children:
    #             node_queue.append(child)
    #
    #     if(is_related_sentence):
    #         logging.info("Related sentence: %s" % sentence.text)
    #
    #     return self.attackgraph_nx

    def parse(self):
        logging.info("---S1-1: Parsing NLP doc to get Attack Graph!---")

        # parse coreference
        self.parse_coref()
        # # parse node
        self.parse_node()
        # parse edge
        self.parse_edge()

    def parse_coref(self):
        logging.info("---S1-1.0: Parsing NLP doc to get Coreference!---")

        for coref_set in self.nlp_doc._.coref_chains:

            # get ioc-related coreferences sets
            coref_origin = 0
            for coref_item in coref_set:
                coref_token = self.nlp_doc[coref_item.root_index]
                # logging.debug("%s-%s" % (coref_token, coref_token.ent_type_))
                if coref_token.ent_type_ in ner_labels:
                    self.ioc_coref_list.append(coref_set)
                    coref_origin = coref_item.root_index
                    break

            # pasing the coreferences
            if coref_origin != 0:
                coref_token = self.nlp_doc[coref_origin]
                logging.debug("---coref_origiin:---\n %s-%s" % (coref_token, coref_token.ent_type_))
                for i in range(0, len(coref_set.mentions)):
                    coref_p = coref_set.mentions[i].root_index
                    if coref_p == coref_origin:
                        continue
                    coref_token = self.nlp_doc[coref_p]
                    self.ioc_coref_dict[coref_p] = coref_origin
                    logging.debug("%s-%s" % (coref_token, coref_token.ent_type_))

    def parse_node(self):
        logging.info("---S1-1.1: Parsing NLP doc to get Attack Graph Nodes!---")

        # parsing all ioc nodes
        for entity in self.nlp_doc.ents:
            ent_root = entity.root
            ent_root_i = ent_root.i
            self.entity_root_token_string_dict[ent_root_i] = entity.text
            for token in entity:
                if token.i not in self.entity_root_token_string_dict.keys():
                    ignore_token_i = token.i
                    self.entity_ignore_token_list.append(ignore_token_i)

        # parsing ioc recognized with iocRegex

    def parse_edge(self):
        logging.info("---S1-1.2: Parsing NLP doc to get Attack Graph Edges!---")

        if self.attackgraph_nx == None:
            self.attackgraph_nx = nx.DiGraph()

        for sentence in self.nlp_doc.sents:
            # try:
            self.parse_edge_sentence(sentence)
            # except:
            #     continue

        return self.attackgraph_nx

    def parse_edge_sentence(self, sentence):
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
            node = node_queue.pop(0)
            for child in node.children:
                node_queue.append(child)

            # process only the ioc_root
            if node.i in self.entity_ignore_token_list:
                continue

            if node.ent_type_ in ner_labels and re.match("NN.*", node.tag_):
                is_related_sentence = True

                # try getting node ioc value
                regex = ""
                if node.idx in self.ioc_identifier.replaced_ioc_dict.keys():
                    regex = self.ioc_identifier.replaced_ioc_dict[node.idx]
                    logging.debug("Recover IoC regex: %s" % regex)

                nlp = ""
                if node.i in self.entity_root_token_string_dict.keys():
                    nlp = self.entity_root_token_string_dict[node.i]
                else:
                    nlp = node.text

                n = get_token_id(node)  # + regex
                logging.debug(n)
                self.attackgraph_nx.add_node(n, type=node.ent_type_, nlp=nlp, regex=regex)

                if tnode != "":
                    self.attackgraph_nx.add_edge(tnode, n, action=tvb)
                tnode = n

            # edges with coreference nodes
            if node.i in self.ioc_coref_dict.keys():
                coref_node = self.nlp_doc[self.ioc_coref_dict[node.i]]

                nlp = ""
                if coref_node.i in self.entity_root_token_string_dict.keys():
                    nlp = self.entity_root_token_string_dict[coref_node.i]
                else:
                    nlp = coref_node.text

                n = get_token_id(coref_node)
                logging.debug(n)
                self.attackgraph_nx.add_node(n, type=coref_node.ent_type_, nlp=nlp)

                if tnode != "":
                    self.attackgraph_nx.add_edge(tnode, n, action=tvb)
                tnode = n

        if(is_related_sentence):
            logging.debug("Related sentence: %s" % sentence.text)

        return self.attackgraph_nx


    # def parse_edge_sentence(self, sentence):
    #     # M1: find Shortest Dependency Path (SDP)
    #     # https://towardsdatascience.com/how-to-find-shortest-dependency-path-with-spacy-and-stanfordnlp-539d45d28239
    #
    #     ioc_nodes = []
    #     edges = []
    #     for token in sentence:
    #         if token.ent_type_ in ner_labels:
    #             ioc_nodes.append(token.i)
    #
    #         for child in token.children:
    #             edges.append(('{0}'.format(token.i), '{0}'.format(child.i)))
    #
    #     graph = nx.DiGraph(edges)
    #     draw_attackgraph_plt(graph)
    #
    #     # https://www.coder.work/article/3134983
    #     # https://stackoverflow.com/questions/61914713/removing-a-node-from-digraph-in-networkx-while-preserving-child-nodes-and-remapp
    #     # https://en.wikipedia.org/wiki/Edge_contraction

    def to_node_sequence(self):
        pass # TODO


def parse_attackgraph_from_text(ner_model: IoCNer, text: str) -> AttackGraph:
    iid = IoCIdentifier(text)
    text_without_ioc = iid.replaced_text
    doc = ner_model.parser(text_without_ioc)
    ag = AttackGraph(doc, ioc_identifier=iid)

    ag.parse()

    return ag


def parse_attackgraph_from_cti_report(ner_model: IoCNer, cti_file: str = r".\data\cti\html\0a84e7a880901bd265439bd57da61c5d.html", output_path: str = ""):
    logging.info("---Parsing %s---" % cti_file)

    # file_name = os.path.splitext(cti_file)[0]
    file_name = Path(cti_file).stem
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
    # iid.display_iocs()
    text_without_ioc = iid.replaced_text
    # iid.check_replace_result()

    doc = ner_model.parser(text_without_ioc)
    ag = AttackGraph(doc, ioc_identifier=iid)

    ag.parse()
    # ag.construct_nxgraph_from_spacydoc(doc)
    dot_graph = draw_attackgraph_dot(ag.attackgraph_nx)

    if output_path == "":
        dot_graph.view()
    else:
        nx.write_gml(ag.attackgraph_nx, os.path.join(output_path, file_name + ".gml"))
        draw_attackgraph_dot(ag.attackgraph_nx, output_file=os.path.join(output_path, file_name))

    return ag

# %%

if __name__ == '__main__':
    logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)

    ner_model = IoCNer("./new_cti.model")
    ner_model.add_coreference()

    # sample = "APT3 has used PowerShell on victim systems to download and run payloads after exploitation."
    # sample = "Wizard Spider has used spearphishing attachments to deliver Microsoft documents containing macros or PDFs containing malicious links to download either Emotet, Bokbot, TrickBot, or Bazar."
    # sample = "Elderwood has delivered zero-day exploits and malware to victims via targeted emails containing a link to malicious content hosted on an uncommon Web server."
    # sample = "APT28 sent spearphishing emails which used a URL-shortener service to masquerade as a legitimate service and to redirect targets to credential harvesting sites."
    # sample = "Magic Hound sent shortened URL links over email to victims. The URLs linked to Word documents with malicious macros that execute PowerShells scripts to download Pupy."
    # sample = "DarkHydrus has sent spearphishing emails with password-protected RAR archives containing malicious Excel Web Query files (.iqy). The group has also sent spearphishing emails that contained malicious Microsoft Office documents that use the 'attachedTemplate' technique to load a template from a remote server."
    #
    # ag = parse_attackgraph_from_text(ner_model, sample)
    # draw_attackgraph_plt(ag.attackgraph_nx)

    # %%

    ag = parse_attackgraph_from_cti_report(ner_model)

    # %%
    # class AttackGraph unit test

    # cti_path = r".\data\cti\html"
    # output_path = r".\data\extracted_attackgraph_subgraphs"
    #
    # cti_files = os.listdir(cti_path)
    # for file in cti_files:
    #     parse_attackgraph_from_cti_report(cti_file=os.path.join(cti_path, file), output_path=output_path, ner_model=ner_model)

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
