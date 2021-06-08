import networkx
import spacy
from nltk import Tree

def to_nltk_tree(node):
    if node.n_lefts + node.n_rights > 0:
        return Tree(node.orth_, [to_nltk_tree(child) for child in node.children])
    else:
        return node.orth_

def tok_format(tok):
    return "_".join([tok.orth_, tok.tag_]) #, tok.dep_])

def to_nltk_formatted_tree(node):
    if node.n_lefts + node.n_rights > 0:
        return Tree(tok_format(node), [to_nltk_formatted_tree(child) for child in node.children])
    else:
        return tok_format(node)


class AG_contructor:
    G = networkx.MultiDiGraph()

    #ToDo: traverse the nlp dependency tree to get the node list and edge list
    def traverse_nlp_tree(self, root):

        pass


if __name__ == '__main__':
    en_nlp = spacy.load('en_core_web_sm')

    doc = en_nlp(
        "In this ongoing campaign, FIN7 is targeting organizations with spear phishing emails containing either a malicious DOCX or RTF file – two versions of the same LNK file and VBScript technique.")

    nodes = [sent.root for sent in doc.sents]
    # root = doc.sents
    tree = [to_nltk_formatted_tree(sent.root) for sent in doc.sents]

    pass
