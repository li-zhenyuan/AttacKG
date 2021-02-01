import matplotlib.pyplot as plt
import networkx as nx


def draw_oceanlotus():
    G = nx.DiGraph()


def draw_dll_hijacking():
    G = nx.DiGraph()

    G.add_node("attacker", type="subject_user", entity="no", necessary="yes")
    G.add_node("(c:\\windows\\(system32|syswow64)|{execution_path})\\*.dll", type="object_file", entity="yes", necessary="yes")
    G.add_edge("attacker", "(c:\\windows\\(system32|syswow64)|{execution_path})\\*.dll", action="write", directly="no", necessary="yes")

    return G
