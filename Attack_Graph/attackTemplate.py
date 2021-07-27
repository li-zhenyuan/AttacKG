from NLP.iocNer import *
from attackGraph import *
from Mitre_TTPs.mitreGraphReader import *

import networkx as nx
import pptree
import pickle
import logging
import re
import Levenshtein


def parse_networkx_node(node: str, nx_graph: nx.DiGraph) -> set:
    node_type = nx_graph.nodes[node]["type"]
    nlp = nx_graph.nodes[node]["nlp"]
    ioc = nx_graph.nodes[node]["regex"]

    return (node_type, nlp, ioc)


class TemplateNode(AttackGraphNode):
    node_type = ""
    node_ioc_representation = ""
    node_nlp_representation = ""
    node_ioc_instance = []
    node_nlp_instance = []
    node_properties = {}

    instance_count = 0
    followup_node_list = []

    def __init__(self, node_info: set):

        self.node_type = node_info[0]
        if node_info[1] != "":
            self.node_nlp_instance.append(node_info[1])
        if node_info[2] != "":
            self.node_ioc_instance.append(node_info[2])

        self.instance_count = 1

        logging.info("---S3: Init TemplateNode %s!---" % (self))

    def __str__(self):
        return "%s-%s-%s-%s" % (self.node_type, str(self.node_ioc_instance), str(self.node_nlp_instance), str(self.instance_count))

    def get_similar_with(self, node_info: set):
        similarity_score = 0.0

        new_node_type = node_info[0]
        new_node_nlp = node_info[1]
        new_node_ioc = node_info[2]

        if self.node_type != new_node_type:
            return similarity_score
        else:
            similarity_score += 0.5

        max_nlp_similarity_score = 0
        for nlp_instance in self.node_nlp_instance:
            ss = get_nlp_similarity(new_node_nlp, nlp_instance)
            if ss >= max_nlp_similarity_score:
                max_nlp_similarity_score = ss

        max_ioc_similarity_score = 0
        for ioc_instance in self.node_ioc_instance:
            ss = get_ioc_similarity(new_node_ioc, ioc_instance)
            if ss >= max_ioc_similarity_score:
                max_ioc_similarity_score = ss

        similarity_score = similarity_score + max_ioc_similarity_score + max_nlp_similarity_score

        return similarity_score

    def update_with(self, node_info: set):



        return self


def get_ioc_similarity(ioc_a: str, ioc_b: str) -> float:
    return get_string_similarity(ioc_a, ioc_b)


def get_nlp_similarity(nlp_a: str, nlp_b: str) -> float:
    return get_string_similarity(nlp_a, nlp_b)


# https://blog.csdn.net/dcrmg/article/details/79228589
def get_string_similarity(a: str, b: str) -> float:
    similarity_score = Levenshtein.ratio(a, b)
    return similarity_score


class TechniqueTemplate:
    NODE_SIMILAR_ACCEPT_THRESHOLD = 0.75

    technique_id_list: list  # '/techniques/T1566/001'
    technique_node_list: list  # [TemplateNode, ...]
    technique_edge_list: dict  # [(TN1, TN2): Count, ...]
    technique_instance: list  # [[(n1,n2), ...]...]
    total_instance_count: int

    def __init__(self, technique_id_list: list):
        self.technique_id_list = technique_id_list
        self.technique_node_list = []
        self.technique_edge_list = {}
        self.technique_instance = []
        self.total_instance_count = 0

    def update_template(self, technique_sample_graph: nx.DiGraph):
        logging.info("---Update template!---")

        sample_node_template_node_dict = {}

        for node in technique_sample_graph.nodes:
            max_similartiy_score = 0
            max_similarity_template_node = None

            for template_node in self.technique_node_list:
                similarity_score = template_node.get_similar_with(technique_sample_graph, node)
                if similarity_score > max_similartiy_score:
                    max_similartiy_score = similarity_score
                    max_similarity_template_node = template_node

                # whether node in new sample is aligned with exist template node
            if max_similartiy_score > self.NODE_SIMILAR_ACCEPT_THRESHOLD:
                sample_node_template_node_dict[node] = template_node
                template_node.update_with(node, technique_sample_graph)
            else:
                tn = TemplateNode(node, technique_sample_graph)


    def pretty_print(self):
        pptree.Node()


def template_list_extraction(technique_list: list = picked_techniques) -> list:
    template_list = []

    for technique in technique_list:
        t = template_extraction(technique)
        template_list.append(t)

    return template_list


def template_extraction(technique: str) -> TemplateNode:
    mgr = MitreGraphReader()
    technique_example_list = mgr.find_examples_for_technique(technique_id)

    t = template_extraction_from_examplelist(technique_example_list)

    return t


# %%

if __name__ == '__main__':
    logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)

    # %%

    technique_list = [r'/techniques/T1566/001', r'/techniques/T1566/002',r'/techniques/T1566/003']
    # technique_list = [r'/techniques/T1053/005']
    # technique_list = [r'/techniques/T1547/001']

    tt = TechniqueTemplate(technique_list)

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
        tt.update_template(ag.attackgraph_nx)
