# %%

import networkx as nx
import sys
import graphviz


from Attack_KG.extract_attack_graph_from_nlp_tree import *


# %%

if __name__ == '__main__':
    AG = nx.Graph()

    AG.add_node("actor", type="APTFamily", nlp="threat actor")
    AG.add_node("email", type="NetLoc", nlp="email")
    AG.add_node("documents", type="DocumentFile", nlp="trojanized Microsoft Word documents", regex="MinutesofMeeting-2May19.docx")

    AG.add_node("template", type="DocumentFile", nlp="remote template")
    AG.add_node("exploit", type="Vulnerability", nlp="known exploit")
    AG.add_node("script", type="ExeFile", nlp="Visual Basic script")

    AG.add_node("website", type="NetLoc", nlp="website", regex="hxxp://droobox[.]online:80/luncher.doc")
    AG.add_node("document_2", type="DocumentFile", nlp="file", regex="luncher.doc")

    AG.add_node("cve", type="Vulnerability", regex="CVE-2017-11882")
    AG.add_node("code", type = "ExeFile", nlp="code")
    AG.add_node("script_2", type="ExeFile", nlp="command script")

    AG.add_node("tasks", type="Service", nlp="scheduled task", regex="WinUpdate")
    AG.add_node("command", type="ExeFile", nlp="PowerShell commands")

    AG.add_node("file_2", type="DocumentFile", nlp="actor-created file", regex=r"LOCALAPPDATA\\Intel\\instal.xml")

    AG.add_edges_from([
        ("actor", "email"),
        ("email", "documents"),
        ("documents", "template"),
        ("documents", "exploit"),
        ("exploit", "script"),
        ("documents", "website"),
        ("documents", "document_2"),
        ("document_2", "cve"),
        ("document_2", "code"),
        ("document_2", "script_2"),
        ("script_2", "tasks"),
        ("tasks", "command"),
        ("actor", "file_2")
    ])

    technique_graphs = {
        "Phishing E-mails": ["actor", "email", "documents"],
        "VB Scripting": ["script"],
        "Phishing Website": ["website", "document_2"],
        "Exploit": ["document_2", "cve", "code"],
        "Persistent": ["tasks", "command"],
        "PowerShell": ["command"]
    }

# %%

    dot = AttacKG_AG.draw_attackgraph(AG, clusters=technique_graphs, output_file="temp")
    dot.view()

# %%
