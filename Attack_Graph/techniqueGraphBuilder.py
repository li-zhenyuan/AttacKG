from attackGraph import *
from attackTemplate import *
from techniqueIdentifier import *

import networkx as nx


class TechniqueGraphBuilder:
    attack_graph: AttackGraph
    attack_match: AttackMatcher

    technique_graph_nx: nx.DiGraph
    technique_subgraph_dict: dict  # technique -> cluster

    def __init__(self, attack_graph: AttackGraph, attack_match: AttackMatcher):
        self.attack_graph = attack_graph
        self.attack_match = attack_match

        self.technique_graph_nx = self.attack_graph.attackgraph_nx
        self.technique_subgraph_dict = {}

    def identify_technique_cluster(self):
        pass


# %%

if __name__ == '__main__':
    pass
