import matplotlib.pyplot as plt
import networkx as nx


def draw_oceanlotus():
    G = nx.DiGraph()

def draw_Registry_autorun():
    G = nx.DiGraph()

    G.add_node("attacker", type="subject_user", necessary="yes")
    G.add_node("(HKEY_CURRENT_USER|HKEY_LOCAL_MACHINE)\Software\Microsoft\Windows\CurrentVersion\(Run|RunOnce)", type="object_registry", necessary="yes")
    G.add_edge("attacker", "(HKEY_CURRENT_USER|HKEY_LOCAL_MACHINE)\Software\Microsoft\Windows\CurrentVersion\(Run|RunOnce)", action="write", directly="no", necessary="yes")
    G.add_node("$execution_path\*.exe", type="object_file", necessary="yes")
    G.add_edge("attacker", "$execution_path\*.exe", action="write", directly="no", necessary="yes")
    G.add_edge("(HKEY_CURRENT_USER|HKEY_LOCAL_MACHINE)\Software\Microsoft\Windows\CurrentVersion\(Run|RunOnce)", "$execution_path\*.exe", action="point_to", directly="yes", necessary="yes")
    G.add_node("*.exe", type="subject_process", necessary="yes")
    G.add_edge("$execution_path\*.exe", "*.exe", action="exection", directly="yes", necessary="yes")
    G.add_node("Autorun", type="subject_process", necessary="yes")
    G.add_edge("Autorun", "*.exe", action="fork", directly="yes", necessary="yes")

    return G

def draw_dll_hijacking():
    G = nx.DiGraph()

    G.add_node("attacker", type="subject_user", necessary="yes")
    G.add_node("(c:\\windows\\(system32|syswow64)|{execution_path})\\*.dll", type="object_file", necessary="yes")
    G.add_edge("attacker", "(c:\\windows\\(system32|syswow64)|{execution_path})\\*.dll", action="write", directly="no", necessary="yes")
    G.add_node("$execution_path\*.exe", type="object_file", necessary="no")
    G.add_edge("attacker", "$execution_path\*.exe", action="write", directly="no", necessary="no")
    G.add_node("*.exe", type="subject_process", necessary="yes")
    G.add_edge("$execution_path\*.exe", "*.exe", action="exection", directly="yes", necessary="yes")
    G.add_edge("*.exe", "(c:\\windows\\(system32|syswow64)|{execution_path})\\*.dll", action="load", directly="yes", necessary="yes")

    return G
