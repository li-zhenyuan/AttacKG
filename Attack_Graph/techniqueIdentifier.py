from attackGraph import *
from attackTemplate import *

import networkx as nx
import math
import matplotlib.pyplot as plt
import logging
import os.path


# Record TechniqueTemplate Matching Record
class TechniqueIdentifier:
    technique_template: TechniqueTemplate

    node_match_record: list
    edge_match_record: list
    node_count: int
    edge_count: int

    def __init__(self, technique_template: TechniqueTemplate):
        self.technique_template = technique_template
        logging.info("---S3.1: Init technique template %s as identifier!---" % technique_template.technique_id_list)

        self.init_node_match_record()
        self.init_edge_match_record()

    def init_node_match_record(self):
        self.node_match_record = {}

        index = 0
        for technique_node in self.technique_template.technique_node_list:
            self.node_match_record[index] = None
            index += 1

        self.node_count = len(self.technique_template.technique_node_list)

    def init_edge_match_record(self):
        pass

    def node_alignment(self, node: str, nx_graph: nx.DiGraph):
        self.init_node_match_record()

        index = 0
        for technique_node in self.technique_template.technique_node_list:
            node_similarity_score = technique_node.get_similar_with(parse_networkx_node(node, nx_graph))

            # accept node as a match
            if node_similarity_score >= TechniqueTemplate.NODE_SIMILAR_ACCEPT_THRESHOLD:
                if self.node_match_record[index] != None and self.node_match_record[index][1] > node_similarity_score:
                    continue
                else:
                    self.node_match_record[index] = (node, node_similarity_score)

            index += 1

    def get_node_alignment_score(self):
        node_alignment_score = 0.0

        for v in self.node_match_record.values():
            if v is not None:
                node_alignment_score += v[1]

        # Normalization
        node_alignment_score /= math.sqrt(self.node_count)

        return node_alignment_score


# Matching process, involve multiple TechniqueIdentifier at one time
class attackMatcher:
    attack_graph_nx: nx.DiGraph
    technique_identifier_list: list

    def __init__(self, attack_graph_nx: nx.DiGraph):
        self.attack_graph_nx = attack_graph_nx
        self.technique_identifier_list = []

    def add_technique_identifier(self, technique_identifier: TechniqueIdentifier):
        self.technique_identifier_list.append(technique_identifier)

    def attack_matching(self, attack_graph_nx: nx.DiGraph = None):
        if attack_graph_nx is not None:
            self.attack_graph_nx = attack_graph_nx
        else:
            attack_graph_nx = self.attack_graph_nx

        subgraph_list = nx.strongly_connected_components(self.attack_graph_nx)
        for subgraph in subgraph_list:
            logging.debug("---Get subgraph: %s---" % subgraph)
            matching_result = []

            for node in subgraph:
                # Try to find a match in technique_identifier_list
                for technique_identifier in self.technique_identifier_list:
                    technique_identifier.node_alignment(node, attack_graph_nx)
            # for edge in subgraph.edges():
            # find the most match technique

            for technique_identifier in self.technique_identifier_list:
                node_alignment_score = technique_identifier.get_node_alignment_score()
                matching_result.append((technique_identifier.technique_template, node_alignment_score))

                logging.info("---S3.2: matching result %s - %f!---" % (technique_identifier.technique_template.technique_id_list, node_alignment_score))


# %%

if __name__ == '__main__':
    logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)

    # %%

    tt_file = "template.json"
    technique_list = [r'/techniques/T1566/001', r'/techniques/T1566/002', r'/techniques/T1566/003']
    tt = TechniqueTemplate(technique_list)
    tt.load_from_file(tt_file)
    ti = TechniqueIdentifier(tt)

    attack_graph_file = r".\data\\extracted_attackgraph_20210803\0a84e7a880901bd265439bd57da61c5d.gml"
    attack_graph_nx = nx.read_gml(attack_graph_file)
    am = attackMatcher(attack_graph_nx)

    am.add_technique_identifier(ti)
    am.attack_matching()
