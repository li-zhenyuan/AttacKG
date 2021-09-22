from attackTemplate import *

import networkx as nx
import logging
import time
import math
import os
import xlsxwriter


# Record TechniqueTemplate Matching Record
class TechniqueIdentifier:
    technique_template: TechniqueTemplate

    node_match_record: dict
    edge_match_record: dict
    node_count: int
    edge_count: int

    def __init__(self, technique_template: TechniqueTemplate):
        self.technique_template = technique_template
        logging.info("---S3.1: Init technique template %s as identifier!---" % technique_template.technique_name)

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
        self.edge_match_record = {}

        index = 0
        for technique_edge in self.technique_template.technique_edge_dict.keys():
            self.edge_match_record[technique_edge] = None
            index += 1

        self.edge_count = len(self.technique_template.technique_edge_dict.keys())

    def node_alignment(self, node: str, nx_graph: nx.DiGraph):
        # self.init_node_match_record()

        index = 0
        for technique_node in self.technique_template.technique_node_list:
            node_similarity_score = technique_node.get_similar_with(parse_networkx_node(node, nx_graph))

            # accept node as a match
            if node_similarity_score >= TechniqueTemplate.NODE_SIMILAR_ACCEPT_THRESHOLD:
                if self.node_match_record[index] is not None and self.node_match_record[index][1] > node_similarity_score:
                    continue
                else:
                    self.node_match_record[index] = (node, node_similarity_score)

            index += 1

    def subgraph_alignment(self, subgraph: set, nx_graph: nx.DiGraph):
        for node in subgraph:
            self.node_alignment(node, nx_graph)

        # for source in subgraph:
        #     for sink in subgraph:

        for template_edge, instance_count in self.technique_template.technique_edge_dict.items():
            source_index = template_edge[0]
            sink_index = template_edge[1]

            # No matched node for edge
            if self.node_match_record[source_index] is None or self.node_match_record[sink_index] is None:
                self.edge_match_record[template_edge] = 0.0
                continue

            source_node = self.node_match_record[source_index][0]
            sink_node = self.node_match_record[sink_index][0]

            if source_node == sink_node:
                distance = 1
            else:
                try:
                    distance = nx.shortest_path_length(nx_graph, source_node, sink_node)
                except:
                    self.edge_match_record[template_edge] = 0.0
                    continue

            source_node_matching_score = self.node_match_record[source_index][1]
            sink_node_matching_score = self.node_match_record[sink_index][1]

            edge_matching_score = math.sqrt(source_node_matching_score * sink_node_matching_score) / distance
            self.edge_match_record[template_edge] = edge_matching_score

    def get_graph_alignment_score(self):
        return self.get_node_alignment_score() + self.get_edge_alignment_score()
        # return self.get_edge_alignment_score()

    def get_node_alignment_score(self):
        node_alignment_score = 0.0

        index = 0
        for node_index, node_similarity in self.node_match_record.items():
            if self.technique_template.technique_node_list[node_index].node_type == "actor":
                continue

            if node_similarity is not None:
                node_alignment_score += node_similarity[1] * (self.technique_template.technique_node_list[node_index].instance_count) # math.sqrt
                # logging.debug("%d-%s-%f" % (index, node_similarity[0], node_alignment_score))

            index += 1

        # Normalization
        # node_alignment_score /= self.node_count + 1  # math.sqrt(self.node_count + 1)
        node_alignment_score /= (self.technique_template.node_normalization + 1)
        return node_alignment_score

    def get_edge_alignment_score(self):
        edge_alignment_score = 0.0

        for edge, edge_similarity in self.edge_match_record.items():
            edge_alignment_score += edge_similarity * (self.technique_template.technique_edge_dict[edge])

        # edge_alignment_score /= self.edge_count + 1
        edge_alignment_score /= (self.technique_template.edge_normalization + 1)

        if edge_alignment_score >= 1:
            print(edge_alignment_score)
            # raise Exception()

        return edge_alignment_score

# Matching process, involve multiple TechniqueIdentifier at one time
class AttackMatcher:
    attack_graph_nx: nx.DiGraph
    technique_identifier_list: list
    technique_matching_score: dict
    technique_matching_subgraph: dict
    technique_matching_record: dict

    normalized_factor: float

    def __init__(self, nx_graph: nx.DiGraph):
        self.attack_graph_nx = nx_graph
        self.technique_identifier_list = []
        self.technique_matching_score = {}
        self.technique_matching_subgraph = {}
        self.technique_matching_record = {}

        self.normalized_factor = nx_graph.number_of_nodes() + nx_graph.number_of_edges()

    def add_technique_identifier(self, technique_identifier: TechniqueIdentifier):
        if technique_identifier.edge_count == 0:
            return

        self.technique_identifier_list.append(technique_identifier)

    def attack_matching(self, nx_graph: nx.DiGraph = None):
        if nx_graph is not None:
            self.attack_graph_nx = nx_graph
        else:
            nx_graph = self.attack_graph_nx

        # subgraph_list = nx.strongly_connected_components(self.attack_graph_nx)
        subgraph_list = nx.connected_components(self.attack_graph_nx.to_undirected())
        for subgraph in subgraph_list:
            logging.debug("---Get subgraph: %s---" % subgraph)
            # matching_result = []

            for technique_identifier in self.technique_identifier_list:
                print(technique_identifier.technique_template.technique_name)
                technique_identifier.init_node_match_record()
                technique_identifier.init_edge_match_record()

                technique_identifier.subgraph_alignment(subgraph, nx_graph)

            # for node in subgraph:
            #     # Try to find a match in technique_identifier_list
            #     for technique_identifier in self.technique_identifier_list:
            #         technique_identifier.node_alignment(node, nx_graph)

            # for edge in subgraph.edges():
            #     for technique_identifier in self.technique_identifier_list:
            #         technique_identifier.edge_alignment(edge, nx_graph)

            # find the most match technique
            for technique_identifier in self.technique_identifier_list:
                node_alignment_score = technique_identifier.get_graph_alignment_score() #/ self.normalized_factor

                if technique_identifier.technique_template.technique_name not in self.technique_matching_score.keys():
                    self.technique_matching_score[technique_identifier.technique_template.technique_name] = node_alignment_score
                    self.technique_matching_subgraph[technique_identifier.technique_template.technique_name] = subgraph
                    self.technique_matching_record[technique_identifier.technique_template.technique_name] = technique_identifier.node_match_record
                elif self.technique_matching_score[technique_identifier.technique_template.technique_name] < node_alignment_score:
                    self.technique_matching_score[technique_identifier.technique_template.technique_name] = node_alignment_score
                    self.technique_matching_subgraph[technique_identifier.technique_template.technique_name] = subgraph
                    self.technique_matching_record[technique_identifier.technique_template.technique_name] = technique_identifier.node_match_record

                # matching_result.append((technique_identifier.technique_template, node_alignment_score))
                logging.debug("---S3.2: matching result %s\n=====\n%s - %f!---" % (technique_identifier.technique_template.technique_name, subgraph, node_alignment_score))

    def print_match_result(self) -> dict:
        logging.info(str(self.technique_matching_score))
        logging.info(str(self.technique_matching_subgraph))
        logging.info(str(self.technique_matching_record))

        # for technique, score in self.technique_matching_score.items():
        #     print(technique + str(score))
        #     for result in self.technique_matching_record[technique]:
        #

        return self.technique_matching_score


class Evaluation:

    def __init__(self):
        self.book = xlsxwriter.Workbook("technique_matching_result.xlsx")
        self.sheet = self.book.add_worksheet('report_pickTechnique')
        self.column_count = 1

        self.match_format = self.book.add_format({'bg_color': '#FFC7CE', 'font_color': '#9C0006'})

    def add_technique_list(self, technique_list: list):
        row_count = 1
        for technique in technique_list:
            self.sheet.write(0, row_count, technique)
            row_count += 1

    def add_result(self, report_name: str, detection_result: dict, ground_truth: list):
        self.sheet.write(self.column_count, 0, report_name)

        row_count = 1
        for technique, result in detection_result.items():
            self.sheet.write(self.column_count, row_count, result)
            technique_name = technique.replace("'", "").replace("_", "/")
            if technique_name in ground_truth:
                self.sheet.conditional_format(self.column_count, row_count, self.column_count, row_count, {'type': '2_color_scale'})
            row_count += 1

        self.column_count += 1


# %%

if __name__ == '__main__':
    logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)
    # logging.basicConfig(filename="running_time_log.txt", filemode='a', level=logging.INFO)
    logging.info("======techniqueIdentifier.py: %s======", time.asctime(time.localtime(time.time())))

    # %%

    # tt_file = r".\data\technique_template\'_techniques_T1059_001'.json"
    # technique_list = [r'/techniques/T1566/001', r'/techniques/T1566/002', r'/techniques/T1566/003']
    # tt = TechniqueTemplate(str(technique_list))
    # tt.load_from_file(tt_file)
    # ti = TechniqueIdentifier(tt)
    #
    # attack_graph_file = r".\data\\extracted_attackgraph_20210804\0a84e7a880901bd265439bd57da61c5d.gml"
    # attack_graph_nx = nx.read_gml(attack_graph_file)
    # am = AttackMatcher(attack_graph_nx)
    #
    # am.add_technique_identifier(ti)
    # am.attack_matching()

    # %%

    tt_path = r"./data/technique_template"
    tt_file_list = os.listdir(tt_path)
    identifier_list = []
    technique_list = []
    for tt_file in tt_file_list:
        filename, ext = os.path.splitext(tt_file)
        if ext != ".json":
            continue
        tt = TechniqueTemplate(filename)
        tt.load_from_file(os.path.join(tt_path, tt_file))
        ti = TechniqueIdentifier(tt)

        if ti.edge_count == 0:
            continue

        technique_list.append(filename)
        identifier_list.append(ti)

    xe = Evaluation()
    xe.add_technique_list(technique_list)

    # %%

    # sample = '''In order to compromise their victims, the threat actors sent the trojanized Microsoft Word documents, probably via email. The first vector relies on a trojanized document that fetches a remote template and then uses a known exploit. The second vector is a trojanized Word document that prompts the victim to enable macros and run a Visual Basic script. We were able to correlate these two techniques to the same threat campaign due to overlapping threat actor C2.
    #     In the first scenario, Talos discovered a document named "MinutesofMeeting-2May19.docx", that appeared to display the national flag of Jordan. Once the victim opens the document, it fetches a remove template from the actor-controlled website, hxxp://droobox[.]online:80/luncher.doc. Once the luncher.doc was downloaded, it used CVE-2017-11882, to execute code on the victim's machine. After the exploit, the file would run a command script to set up persistence as a scheduled task named "WinUpdate". That scheduled task would run a series of base64-encoded PowerShell commands that acted as a stager. The stager will be described in more detail in the next section.
    #     As soon as the user enabled the macro, a robust Visual Basic Application (VBA) script began to execute. The VBA script contained two anti-analysis features. First, it would query Windows Management Instrumentation (WMI) to check if any of the following applications were running.
    #     Once the evasion checks were complete, the threat actors used MSbuild to execute an actor-created file named "LOCALAPPDATA\Intel\instal.xml". Based on lexical analysis, we assess with high confidence that this component of the macro script was based on an open-source project called "MSBuild-inline-task." While this technique was previously documented last year, it has rarely been observed being used in operations. Talos suspects the adversary chose MSBuild because it is a signed Microsoft binary, meaning that it can bypass application whitelisting controls on the host when being used to execute arbitrary code.
    #     Once the "instal.xml" file began execution, it would deobfuscate the base64-encoded commands. This revealed a stager, or a small script designed to obtain an additional payload. While analyzing this stager, we noticed some similarities to the "Get-Data" function of the FruityC2 PowerShell agent. One notable difference is that this particular stager included functionality that allowed the stager to communicate with the command and control (C2) via an encrypted RC4 byte stream. In this sample, the threat actors' C2 server was the domain msdn[.]cloud.
    #     the C2 would return a string of characters. Once the string was RC4 decrypted, it launched a PowerShell Empire agent. The PowerShell script would attempt to enumerate the host to look for certain information. Once the aforementioned information was obtained, it was sent back to the threat actor's C2.'''
    # sample = r"Tried multiple times to exploit the browser and use BITS to download and run the verifier executable.  This was done by browsing to http://215.237.119.171/config.html.  At this point, Firefox should have connected out to 68.149.51.179 to download and execute dbgstat.dll and tester.exe.  We think the files were downloaded but not executed, although we could find no instance of the files on disk where we would expect them.  Instead, we scp’ed the files to the target and ran them using an Administrator command prompt.  Tester.exe (verifier) opened dbgstat.dll (drakon.dll) and registered it as a verifier DLL for Firefox in the Windows registry.  The result is that every time a new Firefox process is started, drakon.dll is injected into it automatically and executed.  We configured the OC2 to automatically run the same script each time a new connection was received, including hostname, whoami, and ps.  We left the drakon.dll verifier enabled throughout the remaining engagement, resulting in 126 drakon instances and C2 connections."

    # Cobalt Campaign
    # sample = r'''All observed attacks start with an email message, containing either a malicious attachment or a URL which leads to the first stage of the attack. The text of the emails is likely taken from legitimate email, such as mailing lists that targeted organizations may be subscribed to. Below are three examples, with the first one purporting to be sent by the European Banking Federation and is using a newly registered domain for the spoofed sender email address. The attachment is a malicious PDF file that entices the user to click on a URL to download and open a weaponized RTF file containing exploits for CVE-2017-11882, CVE-2017-8570 and CVE-2018-8174. The final payload is a JScript backdoor also known as More_eggs that allows the attacker to control the affected system remotely.
    #     Notable applications used in these attacks are cmstp and msxsl. The Microsoft Connection Manager Profile Installer (cmstp.exe) is a command-line program used to install Connection Manager service profiles. Cmstp accepts an installation information file (INF) as a parameter and installs a service profile leveraged for remote access connections. A malicious INF file can be supplied as a parameter to download and execute remote code. Cmstp may also be used to load and execute COM scriptlets (SCT files) from remote servers.
    #     Microsoft allows developers to create COM+ objects in script code stored in an XML document, a so-called scriptlet file. Although it is common to use JScript or VBScript, as they are available in Windows by default, a scriptlet can contain COM+ objects implemented in other languages, including Perl and Python, which would be fully functional if the respective interpreters are installed.
    #     To bypass AppLocker and launching script code within a scriptlet, the attacker includes the malicious code within an XML script tag placed within the registration tag of the scriptlet file and calls cmstp with appropriate parameters.
    #     An earlier part of the second stage is implemented as an encrypted JScript scriptlet which eventually drops a randomly named COM server DLL binary with a .txt filename extension, for example, 9242.txt, in the user's home folder and registers the server using the regsvr32.exe utility.The dropper contains an encrypted data blob that is decrypted and written to the disk. The dropper then launches the next stage of the attack by starting PowerShell, msxsl or cmstp.exe as described above.
    #     The PowerShell chain is launched from an obfuscated JScript scriptlet previously downloaded from the command and control (C2) server and launched using cmstp.exe. The first PowerShell stage is a simple downloader that downloads the next PowerShell stage and launches a child instance of powershell.exe using the downloaded, randomly named script as the argument. The downloaded PowerShell script code is obfuscated in several layers before the last layer is reached. The last layer loads shellcode into memory and creates a thread within the PowerShell interpreter process space.
    #     On the PowerShell side of the infection chain, the downloaded final payload is a Cobalt Strike beacon, which provides the attacker with rich backdoor functionality.
    # '''

    # Firefox DNS Drakon APT
    sample = "The attack started by browsing to http://128.55.12.167:8641/config.html, selecting DNS, entering hostname Xx--ls8h.com, file 938527054, and clicking the Visit button.  This triggered the Firefox backdoor to connect out via DNS to XX--ls8h.com.  Drakon APT was downloaded and executed and connected to 128.55.12.167:8640 for C2.  The attacker escalated privileges using the new File System Filter Driver, which looks for processes opening specific files which don’t exist and elevates them.  Once SYSTEM, the attacker exfil’ed the host and network files as well as a passwd file in the home directory."

    # sample = "Benign activity ran for most of the morning while the tools were being setup for the day.  The activity was modified so the hosts would open Firefox and browse to http://215.237.119.171/config.html.  The simulated host then entered URL for BITS Micro APT as http://68.149.51.179/ctfhost2.exe.   We used the exploited Firefox backdoor to initiate download of ctfhost2.exe via the Background Intelligent Transfer Service (BITS).  Our server indicated the file was successfully downloaded using the BITS protocol, and soon after Micro APT was executed on the target and connected out to 113.165.213.253:80 for C2.  The attacker tried to elevate using a few different drivers, but it failed once again due to the computer having been restarted without disabling driver signature enforcement.  BBN tried using BCDedit to permanently disable driver signing, but it did not seem to work during the engagement as the drivers failed to work unless driver signing was explicitly disabled during boot."

    ner_model = IoCNer("./new_cti.model")
    ner_model.add_coreference()
    ag = parse_attackgraph_from_text(ner_model, sample)

    am = AttackMatcher(ag.attackgraph_nx)
    for ti in identifier_list:
        am.add_technique_identifier(ti)
    am.attack_matching()
    matching_result = am.print_match_result()

    clusters = {}
    for key in am.technique_matching_score.keys():
        if am.technique_matching_score[key] > 1.1:
            print(key)
            print(am.technique_matching_record[key])

            clusters_node_list = []
            for k, v in am.technique_matching_record[key].items():
                if v is not None:
                    clusters_node_list.append(v[0])

            clusters[key] = clusters_node_list

    draw_attackgraph_dot(ag.attackgraph_nx, clusters=clusters).view()

    # %%

    # ===================Technique Identification in Reports=================================================
    # with open(r"report_picked_technique.json", "r") as output:
    #     data_json = output.read()
    #     report_technique_dict = json.loads(data_json)

    # am_list = []
    # for report, ground_truth in report_technique_dict.items():
    #     report_name, ext = os.path.splitext(report)
    #     report_graph_file = r"./data/picked_extracted_attackgraph_20210807/%s.gml" % report_name
    #     logging.info(report_graph_file)
    #
    #     try:
    #         report_graph_nx = nx.read_gml(report_graph_file)
    #     except:
    #         continue
    #     am = AttackMatcher(report_graph_nx)
    #     for ti in identifier_list:
    #         am.add_technique_identifier(ti)
    #     am.attack_matching()
    #     matching_result = am.print_match_result()
    #
    #     xe.add_result(report, matching_result, ground_truth)
    #     am_list.append(am)

    # ===================Technique Identification in Examples=================================================
    # for file in os.listdir(r"./data/procedure_examples"):
    #     file_name, ext = os.path.splitext(file)
    #     if ext != ".gml":
    #         continue
    #
    #     example_graph = nx.read_gml(r"./data/procedure_examples/" + file)
    #     # if len(example_graph.nodes()) <= 1:
    #     #     continue
    #
    #     am = AttackMatcher(example_graph)
    #     for ti in identifier_list:
    #         am.add_technique_identifier(ti)
    #     am.attack_matching()
    #     matching_result = am.print_match_result()
    #
    #     xe.add_result(file_name, matching_result, [])
    #
    # # xe.book.save()
    # xe.book.close()
