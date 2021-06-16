# %%

from AttacKG import *

import networkx as nx


# %%

def get_technique_example_dict():
    G = nx.read_gml(r'C:\Users\xiaowan\Documents\GitHub\AttacKG\Mitre_TTPs\Tactic_Technique_Reference_Example.gml')

    technique_list = []
    technique_example_dict = {}

    for technique in list(G.nodes()):
        if G.nodes[technique]['types'].find('technique') != -1:
            technique_list.append(technique)

    for technique in technique_list:
        technique_example_dict[technique] = []

        for example in G.neighbors(technique):
            if G.nodes[example]['types'].find('examples') != -1:
                technique_example_dict[technique].append(re.sub("(\[\d+\])+", '', example))

    return technique_example_dict


# %%

if __name__ == '__main__':
    technique_example_dict = get_technique_example_dict()
    phishing_email_example = technique_example_dict[r'/techniques/T1566/001']

    ag = AttacKG_AG()
    # ner_model = NER_With_Spacy("./new_cti.model")
    ner_model = NER_With_Spacy("en_core_web_sm")
    for example in phishing_email_example:
        doc = ner_model.parser(example)
        # try:
        G = ag.construct_AG_from_spacydoc(doc)
        # except:
        #     continue
        view_graph(G)
