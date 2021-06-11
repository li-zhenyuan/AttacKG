# %%

import spacy
import networkx as nx
import re
from nltk import Tree
import matplotlib.pyplot as plt
import sys

sys.path.append("..")
from NLP import ner_with_spacy
from NLP.extract_text_from_file import *

# %%

ner_labels = ["NetLoc", "Attacker", "ExeFile", "ScriptsFile", "DocFile", "E-mail", "Registry", "File", "Vulnerability",
              "C2C", "SensInfo", "Service"]


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


class AttacKG_Node:
    node_summary = ""

    regexs = []
    descriptions = []

    # ToDo: Check if one node belong to this type.
    def node_check(self, node: dict) -> float:
        similarity = 0.0
        return similarity

    # ToDo: update node representation
    def node_update(self, node: dict):
        pass


class AttacKG_AG:
    technique_name = ""

    nodes = {}  # node representation -> confidence score
    edge_sets = {}  # (node_a, node_b) -> confidence score

    def construct_AG_from_spacydoc(self, sentence, G = None):
        if G == None:
            G = nx.Graph()

        node_queue = []
        tvb = ""
        tnode = ""

        # sents = [sent for sent in doc.sents]
        # root = sents[0].root
        root = sentence.root

        node_queue.append(root)
        while node_queue:
            node = node_queue.pop()
            print("@".join([node.text, node.tag_, node.ent_type_]))
            if re.match("VB.*", node.tag_):
                tvb = node.text
            if re.match("NN.*", node.tag_):
                # if node.ent_type_ != "":
                if node.ent_type_ in ner_labels:
                    n = "@".join([node.text, node.ent_type_])
                    G.add_node(n)
                    print("--" + node.ent_type_)
                    if tnode != "" and tvb != "":
                        G.add_edge(tnode, n, action=tvb)
                    tnode = n
            for child in node.children:
                node_queue.append(child)

        return G


class AttacKG_TG:
    akg_version = 0.1

    t_nodes = []
    t_edges = {}  # (node_a, node_b) -> (confidence score, connection)


def init_akg_template() -> AttacKG_TG:
    akg = AttacKG_TG

    return akg


# %%

if __name__ == '__main__':
    ner_model = ner_with_spacy.NER_With_Spacy("./new_cti.model")

# %%

    sample = "APT12 has sent emails with malicious Microsoft Office documents and PDFs attached."
    sample = "APT3 has used PowerShell on victim systems to download and run payloads after exploitation."
    sample = "Sandworm Team has delivered malicious Microsoft Office attachments via spearphishing."
    sample = "Windshift has sent spearphishing emails with attachment to harvest credentials and deliver malware."

    doc = ner_model.parser(sample)

    ag = AttacKG_AG()
    G = ag.construct_AG_from_spacydoc(doc)

# %%

    file = r"C:\Users\xiaowan\Documents\GitHub\AttacKG\data\cti\html\0a84e7a880901bd265439bd57da61c5d.html"
    text = read_html(file)

    # sentences = spacy_stentencizer(text, "./new_cti.model")
    doc = ner_model.parser(text)

    G = None
    for sentence in doc.sents:
        try:
            G = ag.construct_AG_from_spacydoc(sentence, G)
        except:
            print("---No Root!---")

# %%

    # nx.draw_networkx(G)
    # plt.show()

    graph_pos = nx.spring_layout(G)
    nx.draw_networkx_nodes(G, graph_pos, node_size=10, node_color='blue', alpha=0.3)
    nx.draw_networkx_edges(G, graph_pos)
    nx.draw_networkx_labels(G, graph_pos, font_size=8, font_family='sans-serif')
    # edge_labels = nx.get_edge_attributes(G, 'action')
    # nx.draw_networkx_edge_labels(G, graph_pos, edge_labels=edge_labels)
    plt.show()
