from attackGraph import *
from attackTemplate import *

import networkx as nx
import matplotlib.pyplot as plt
import logging
import os.path


# Record TechniqueTemplate Matching Record
class TechniqueIdentifier:
    technique_template: TechniqueTemplate

    node_match_record: list
    edge_match_record: list

    def __init__(self, technique_template: TechniqueTemplate):
        self.technique_template = technique_template
        # TODO

    def node_alignment(self):
        pass

# Matching process, involve multiple TechniqueTemplate at one time
class attackMatcher:
    attack_graph_nx: nx.DiGraph
    technique_template_list: list

    def __init__(self, attack_graph_nx: nx.DiGraph):
        self.attack_graph_nx = attack_graph_nx
        self.technique_template_list = []

    def add_technique_template(self, technique_template: TechniqueTemplate):
        self.technique_template_list.append(technique_template)

    def attack_matching(self, attack_graph_nx: nx.DiGraph = None):
        if attack_graph_nx is not None:
            self.attack_graph_nx = attack_graph_nx

        subgraph_list = nx.connected_components(self.attack_graph_nx)
        for subgraph in subgraph_list:
            for node in subgraph.nodes():



# %%

if __name__ == '__main__':
    tt_file = "template.json"
    tt = TechniqueTemplate()
    tt.load_from_file(tt_file)

    attack_graph_file = r".\data\extracted_attackgraph_2\0a84e7a880901bd265439bd57da61c5d.gml"
    attack_graph_nx = nx.read_gml(attack_graph_file)
    am = attackMatcher(attack_graph_nx)
