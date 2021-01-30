import matplotlib.pyplot as plt
import networkx as nx


def draw_oceanlotus():
    G = nx.DiGraph()


def draw_dll_hijacking():
    G = nx.DiGraph()

    G.add_edge("attacker", "(c:\\windows\\(system32|syswow64)|{execution_path})\\*.dll", action="write", directly="no")

    return G
