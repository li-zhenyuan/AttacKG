# %%

import networkx as nx
import sys
import graphviz


from Attack_KG.AttacKG import *


# %%

if __name__ == '__main__':
    AG = nx.Graph()

    AG.add_node("actor", type="APTFamily", nlp="threat actor")
    AG.add_node("email", type="NetLoc", nlp="email")
    AG.add_node("documents", type="DocumentFile", nlp="trojanized Microsoft Word documents", regex="MinutesofMeeting-2May19.docx")

    AG.add_node("template", type="DocumentFile", nlp="remote template")
    AG.add_node("exploit", type="Vulnerability", nlp="known exploit")
    AG.add_node("script", type="ExeFile", nlp="Visual Basic script")

    AG.add_edges_from([("actor", "email"), ("email", "documents"), ("documents", "template"), ("documents", "exploit"), ("exploit", "script")])

    technique_graphs = {
        "Phishing E-mails": ["actor", "email", "documents"],
        "VB Scripting": ["script"]
    }

# %%

    dot = AttacKG_AG.draw_AG(AG, output_file="temp")

