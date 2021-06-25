import logging

from attackGraph import *

import networkx as nx
import pickle


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


class TemplateNode:

    type = ""
    details = {}

    follow_up_count = 0
    possible_follow_up = []  # [leaf_node, count]

    def __init__(self, type="APTFamily"):
        self.type = type
        self.follow_up_count = 0
        self.possible_follow_up = []

    def __str__(self, level=0):
        ret = "\t"*level + self.type + ":" + str(self.follow_up_count) + "\n"
        for child in self.possible_follow_up:
            ret += child[0].__str__(level+1)
        return ret

    def add_follow_up(self, single_tree):
        self.follow_up_count += 1
        logging.debug("--Add {} to {}".format(single_tree.type, self.type))

        for i in range(0, len(self.possible_follow_up)):
            f, count = self.possible_follow_up[i]
            if node_similarity(single_tree, f) >= 0.5:
                self.possible_follow_up[i][1] += 1
                # ToDo: update leaf details

                if single_tree.follow_up_count != 0:
                    self.possible_follow_up[i][0].add_follow_up(single_tree.possible_follow_up[0][0])

                return

        self.possible_follow_up.append([single_tree, 1])


def node_similarity(n: TemplateNode, m: TemplateNode):
    # ToDo: take details into consideration
    similarity = 0

    if n.type == m.type:
        similarity += 0.5

    return similarity


def attack_graph_to_sequence(G):
    template_node_list = []

    for node in G.nodes:
        if G.nodes[node]["type"] == "APTFamily":
            continue

        node = TemplateNode(G.nodes[node]["type"])
        template_node_list.append(node)

    return template_node_list


def nlp_node_list_to_sequence(node_list):
    template_node_list = []

    for node in node_list:
        property_list = node.split("@")
        type = property_list[1]
        detail = property_list[0]

        if type == "APTFamily":
            continue

        template_node = TemplateNode(type)
        template_node_list.append(template_node)

    return template_node_list


def sequence_to_singletree(node_list):
    # node_list = attack_graph_to_sequence(G)
    logging.info("---Generate singletree!---")

    n = node_list[-1]
    for i in range(len(node_list)-2, -1, -1):
        node_list[i].add_follow_up(n)
        n = node_list[i]

    for node in node_list:
        logging.debug(node.type + ":" + str(len(node.possible_follow_up)))

    return n


# ToDo: Divide template into basic block and advanced block according to node appearance frequency in reports.
class TechniqueTemplate:

    root_node = TemplateNode()

    def update_template(self, node_list):
        logging.info("---Update template!---")

        # node_list = attack_graph_to_sequence(G)  # ToDo: Sort the node_list before build template tree
        if len(node_list) == 0:
            return
        single_tree = sequence_to_singletree(node_list)
        logging.debug(single_tree)

        self.root_node.add_follow_up(single_tree)

        return single_tree


# %%

if __name__ == '__main__':
    technique_example_dict = get_technique_example_dict()

# %%

    # '/techniques/T1566/00[1|2|3]',
    phishing_email_example = []

    phishing_email_example += technique_example_dict[r'/techniques/T1566/001']
    phishing_email_example += technique_example_dict[r'/techniques/T1566/002']
    phishing_email_example += technique_example_dict[r'/techniques/T1566/003']

    # phishing_email_example += technique_example_dict[r'/techniques/T1114/001']
    # phishing_email_example += technique_example_dict[r'/techniques/T1114/002']

# %%

    ag = AttackGraph()
    ner_model = IoCNer("./new_cti.model")
    # ner_model = NER_With_Spacy("en_core_web_sm")

    tt = TechniqueTemplate()

    for example in phishing_email_example:
        logging.debug(example)

        doc = ner_model.parser(example)
        # displacy.serve(doc, style="dep")

        # G = ag.construct_AG_from_spacydoc(doc)
        # view_graph(G)

        # node_list = tt.update_template(G)
        # single_tree = tt.update_template(node_list)

        nlp_node_list = ag.extract_entity_list_from_spacydoc(doc)
        template_node_list = nlp_node_list_to_sequence(nlp_node_list)
        single_tree = tt.update_template(template_node_list)

        logging.debug(tt.root_node)

# %%

    with open("phishing_email.template", 'wb') as f:
        pickle.dump(tt, f)
