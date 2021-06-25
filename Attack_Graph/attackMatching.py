# %%

# Simplified technique matching
# Attack graph are stored in NetworkX instance

from extract_attack_graph_from_nlp_tree import *
from template_extraction import *

import networkx as nx
import matplotlib.pyplot as plt

# %%

def draw_AttacKG(G: nx.MultiDiGraph):
    graph_pos = nx.spring_layout(G)
    nx.draw_networkx_nodes(G, graph_pos, node_size=10, node_color='blue', alpha=0.3)
    nx.draw_networkx_edges(G, graph_pos)
    nx.draw_networkx_labels(G, graph_pos, font_size=8, font_family='sans-serif')
    plt.show()


AttacKG_node_types = ["Attacker", "ExeFile", "DocFile", "Registry", "Service", "Vulnerability", "NetLoc"]
AttacKG_node_regex = {}
AttacKG_node_details = {}
AttacKG_node_equivalence_groups = {}

# ToDo
def get_regex_similarity(re_a: str, re_b: str) -> float:
    return 0.0

# ToDo
def get_description_similarity(description_a: str, description_b: str) -> float:
    return 0.0

# Return a score range from 0 to 10
def AttacKG_node_matching(node_a, node_b) -> float:
    similarity_score = 0

    # type matching
    if node_a["type"] != node_b["type"]:
        return 0

    # regex matching
    try:
        if node_a["regex"] != "" and node_b["regex"] != "":
            similarity_score = get_regex_similarity(node_a["regex"], node_b["regex"])
    except:
        print("node_a: %s\n or node_b: %s\n have no regex" % (str(node_a), str(node_b)))

    # description matching
    try:
        if node_a["description"] != "" and node_b["description"] != "":
            ss = get_description_similarity(node_a["description"], node_b["description"])
            if ss > similarity_score:
                similarity_score = ss
    except:
        print("node_a: %s\n or node_b: %s\n have no description" % (str(node_a), str(node_b)))

    return similarity_score

def AttacKG_matching():
    pass

# %%

class Technique_identifier:
    technique_variant_tree = {}

    def add_technique_variant_tree(self, template:Technique_template, technique_name="UNKOWN"):
        self.technique_variant_tree[technique_name] = template


    def identify_technique_in_nodelist(self, node_list):

        pass

    def identify_technique_in_attackgraph(self, G):
        pass


# %%

if __name__ == '__main__':

    with open("phishing_email.template", 'r') as f:
        tt = pickle.load(f)

        key_nodes = tt.root_node.possible_follow_up()

    # example_t1059_001_1 = "APT19 used PowerShell commands to execute payloads."
    # akg_t1059_001_1 = nx.DiGraph()
    # akg_t1059_001_1.add_nodes_from(["APT19",
    #                                 "PowerShell commands",
    #                                 "payloads"])
    # akg_t1059_001_1.add_edges_from([("APT19", "PowerShell commands"),
    #                                 ("PowerShell commands", "payloads")])
    # draw_AttacKG(akg_t1059_001_1)
    #
    # example_t1059_001_2 = "APT28 downloads and executes PowerShell scripts."
    # akg_t1059_001_2 = nx.DiGraph()
    # akg_t1059_001_2.add_nodes_from(["APT19",
    #                                 "PowerShell scripts"])
    # akg_t1059_001_2.add_edges_from([("APT19", "PowerShell scripts")])
    # draw_AttacKG(akg_t1059_001_2)




