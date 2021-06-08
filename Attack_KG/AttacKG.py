#%%

import spacy
import networkx
import re
from nltk import Tree
import matplotlib.pyplot as plt
import sys

sys.path.append("..")
from NLP import ner_with_spacy

#%%

def to_nltk_tree(node):
    if node.n_lefts + node.n_rights > 0:
        return Tree(node.orth_, [to_nltk_tree(child) for child in node.children])
    else:
        return node.orth_

def tok_format(tok):
    return "@".join([tok.orth_, tok.tag_, tok.dep_, tok.ent_type_]) #, tok.dep_])

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

    def construct_AG_from_spacydoc(self, doc):
        G = networkx.Graph()

        node_queue = []
        tvb = ""
        tnode = ""

        sents = [sent for sent in doc.sents]
        root = sents[0].root
        node_queue.append(root)
        while node_queue:
            node = node_queue.pop()
            print(node)
            if re.match("VB.*", node.tag_):
                tvb = node.text
            if re.match("NN.*", node.tag_):
                if node.ent_type_ != "":
                    G.add_node(node.text)
                    if tnode != "" and tvb != "":
                        G.add_edge(tnode, node.text)
                    tnode = node.text
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

#%%

if __name__ == '__main__':
    sample = "APT3 has used PowerShell on victim systems to download and run payloads after exploitation."

    ner_model = ner_with_spacy.NER_With_Spacy("en_core_web_sm")
    # ner_model = NER_With_Spacy()
    labeled_data = ner_model.read_labeled_data(r"C:\Users\xiaowan\Documents\GitHub\AttacKG\NLP\Doccano\admin.jsonl")
    spacy_data = ner_model.convert_data_format(labeled_data)
    ner_model.train_model(spacy_data)

    # ner_model.nlp.replace_pipe("parser", "parser", source="en_core_web_sm")
    doc = ner_model.nlp(sample)
    print([(ent.text, ent.label_) for ent in doc.ents])

    ner_model.ner_with_regex()
    doc = ner_model.nlp(sample)
    print([(ent.text, ent.label_) for ent in doc.ents])
    sents = [sent for sent in doc.sents]

#%%

    ag = AttacKG_AG()
    G = ag.construct_AG_from_spacydoc(doc)

    networkx.draw_networkx(G)
    plt.show()
