from NLP.iocNer import *
from attackGraph import *
from Mitre_TTPs.mitreGraphReader import *

import networkx as nx
import pptree
import pickle
import logging
import re
import Levenshtein


class TemplateNode(AttackGraphNode):
    template = None

    node_type = ""
    node_ioc_representation = ""
    node_nlp_representation = ""
    node_ioc_instance = []
    node_nlp_instance = []
    node_properties = {}

    instance_count = 0
    followup_node_list = []

    def __init__(self, template=None,  node_type=""):
        self.template = template
        self.node_type = node_type

        self.instance_count = 1
        self.followup_node_list = []

        # logging.info("---Init TemplateNode %s for %s!---" % (self, template.template_name))

    def __str__(self):
        return self.node_type + str(self.instance_count)

    # def __str__(self, level=0):
    #     ret = "\t" * level + self.node_type + ":" + str(self.instance_count) + "\n"
    #     for child in self.followup_node_list:
    #         ret += child[0].__str__(level + 1)
    #     return ret

    def is_similar_with(self, new_node):
        if node_similarity(self, new_node) >= 0.5:
            return True
        else:
            return False

    def update_with(self, new_node):
        self.node_ioc_instance += new_node.node_ioc_instance
        self.node_nlp_instance += new_node.node_nlp_instance

        # TODO: update representation

        return self

    def add_followup_node(self, new_node):
        logging.debug("--Add {} to {}".format(new_node, self))

        self.instance_count += 1

        # check if the new node belong to existing nodes templates
        # if True: update the existing node
        for i in range(0, len(self.followup_node_list)):
            existing_node = self.followup_node_list[i]
            if existing_node.is_similar_with(new_node):
                return existing_node.update_with(new_node)

        # if False: add new node
        self.followup_node_list.append(new_node)
        return new_node


# ToDo
def node_similarity(n: TemplateNode, m: TemplateNode):
    # ToDo: take details into consideration
    similarity = 0.0

    if n.node_type != m.node_type:
        return 0.0
    else:
        similarity += 0.5

    return similarity


def get_ioc_similarity(ioc_a: str, ioc_b: str) -> float:
    return get_string_similarity(ioc_a, ioc_b)


def get_nlp_similarity(nlp_a: str, nlp_b: str) -> float:
    return get_string_similarity(nlp_a, nlp_b)


# https://blog.csdn.net/dcrmg/article/details/79228589
def get_string_similarity(a: str, b: str) -> float:
    similarity_score = Levenshtein.ratio(a, b)
    return similarity_score


# def attack_graph_to_node_sequence(attack_graph):
#     template_node_list = []
#
#     for node in attack_graph.nodes:
#         if attack_graph.nodes[node]["type"] == "APTFamily":
#             continue
#
#         node = TemplateNode(attack_graph.nodes[node]["type"])
#         template_node_list.append(node)
#
#     return template_node_list


# def nlp_node_list_to_sequence(node_list):
#     template_node_list = []
#
#     for node in node_list:
#         property_list = node.split("@")
#         type = property_list[1]
#         detail = property_list[0]
#
#         if type == "APTFamily":
#             continue
#
#         template_node = TemplateNode(type)
#         template_node_list.append(template_node)
#
#     return template_node_list


# def sequence_to_singletree(node_list):
#     # node_list = attack_graph_to_sequence(G)
#     logging.info("---Generate singletree!---")
#
#     n = node_list[-1]
#     for i in range(len(node_list) - 2, -1, -1):
#         node_list[i].add_followup_node(n)
#         n = node_list[i]
#
#     for node in node_list:
#         logging.debug(node.node_type + ":" + str(len(node.followup_node_list)))
#
#     return n


# TODO: divide template into basic block and advanced block according to node appearance frequency in reports.
class TechniqueTemplate:
    # root_node = TemplateNode()
    # ag: AttackGraph
    # ner_model = IoCNer("./new_cti.model")

    technique_id: str  # '/techniques/T1566/001'
    technique_node_list: dict  # [TemplateNode: Count, ...]
    technique_edge_list: dict  # [(TN1, TN2): Count, ...]
    technique_instance: list  # [[(n1,n2), ...]...]
    total_instance_count: int

    def __init__(self, technique_id: str):
        self.technique_id = technique_id
        self.technique_node_list = []
        self.technique_edge_list = []
        self.technique_instance = []
        self.total_instance_count = 0

    def update_template(self, technique_graph: nx.DiGraph):
        logging.info("---Update template!---")

        # node_list = attack_graph_to_sequence(G)  # TODO: sort the node_list before build template tree
        if len(node_list) == 0:
            return
        single_tree = sequence_to_singletree(node_list)
        logging.debug(single_tree)

        self.root_node.add_followup_node(single_tree)

        return single_tree

    def template_list_extraction(self, technique_list: list = picked_techniques) -> list:
        template_list = []

        for technique in technique_list:
            t = self.template_extraction(technique)
            template_list.append(t)

        return template_list

    def template_extraction(self, technique: str) -> TemplateNode:
        mgr = MitreGraphReader()
        technique_example_list = mgr.find_examples_for_technique(technique_id)

        t = self.template_extraction_from_examplelist(technique_example_list)

        return t

    # def template_extraction_from_examplelist(self, example_list: list) -> TemplateNode:
    #     self.root_node = TemplateNode()
    #
    #     for e in example_list:
    #         logging.debug(e)
    #
    #         doc = self.ner_model.parser(e)
    #
    #         nlp_node_list = extract_entity_list_from_spacydoc(doc)
    #         template_node_list = nlp_node_list_to_sequence(nlp_node_list)
    #         self.update_template(template_node_list)
    #
    #         logging.debug(self.root_node)
    #
    #     return self.root_node

    def pretty_print(self):
        pptree.Node()



# %%

if __name__ == '__main__':
    logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)

    # %%

    technique_list = [r'/techniques/T1566/001', r'/techniques/T1566/002',r'/techniques/T1566/003']
    # technique_list = [r'/techniques/T1053/005']
    # technique_list = [r'/techniques/T1547/001']

    example_list = []
    mgr = MitreGraphReader()
    for technique_id in technique_list:
        example_list += mgr.find_examples_for_technique(technique_id)

    ner_model = IoCNer("./new_cti.model")
    ner_model.add_coreference()

    for example in example_list:
        example = re.sub("\[[0-9]+\]+", "", example)
        print(example)

        ag = parse_attackgraph_from_text(ner_model, example)
        draw_attackgraph_plt(ag.attackgraph_nx)

    # 'APT-C-36 has used spearphishing emails with password protected RAR attachment to avoid being detected by the email gateway.[2] '

    # %%

    # ag = AttackGraph()
    # ner_model = IoCNer("./new_cti.model")
    # ner_model = NER_With_Spacy("en_core_web_sm")

    # tt = TechniqueTemplate()
    # tt.template_extraction_from_examplelist(phishing_email_example)

    # for example in phishing_email_example:
    #     logging.debug(example)
    #
    #     doc = ner_model.parser(example)
    #     # displacy.serve(doc, style="dep")
    #
    #     # G = ag.construct_AG_from_spacydoc(doc)
    #     # view_graph(G)
    #
    #     # node_list = tt.update_template(G)
    #     # single_tree = tt.update_template(node_list)
    #
    #     nlp_node_list = ag.extract_entity_list_from_spacydoc(doc)
    #     template_node_list = nlp_node_list_to_sequence(nlp_node_list)
    #     single_tree = tt.update_template(template_node_list)
    #
    #     logging.debug(tt.root_node)

    # %%

    # with open("phishing_email.template", 'wb') as f:
    #     pickle.dump(tt, f)
