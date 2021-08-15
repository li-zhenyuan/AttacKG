from attackGraph import *
from attackTemplate import *
from techniqueIdentifier import *

import networkx as nx


class TechniqueGraphBuilder:
    attack_graph: AttackGraph
    attack_match: AttackMatcher

    def __init__(self, attack_graph: AttackGraph, attack_match: AttackMatcher):
        

