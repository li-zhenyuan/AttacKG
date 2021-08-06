import os
import json
import networkx as nx
import logging
import sys
import csv


picked_techniques = {"/techniques/T1566/001",
                     "/techniques/T1566/002",
                     "/techniques/T1566/003",
                     "/techniques/T1195/001",
                     "/techniques/T1195/002",
                     "/techniques/T1059/001",
                     "/techniques/T1059/003",
                     "/techniques/T1059/005",
                     "/techniques/T1059/007",
                     "/techniques/T1559/001",
                     "/techniques/T1204/001",
                     "/techniques/T1204/002",
                     "/techniques/T1204/003",
                     "/techniques/T1053/005",
                     "/techniques/T1547/001",
                     "/techniques/T1037/001",
                     "/techniques/T1547/001",
                     "/techniques/T1547/002",
                     "/techniques/T1112",
                     "/techniques/T1218/005",
                     "/techniques/T1218/010",
                     "/techniques/T1218/011",
                     "/techniques/T1078/001",
                     "/techniques/T1518/001",
                     "/techniques/T1083",
                     "/techniques/T1057",
                     "/techniques/T1012",
                     "/techniques/T1497/001",
                     "/techniques/T1560/001",
                     "/techniques/T1123",
                     "/techniques/T1119",
                     "/techniques/T1041"}


class MitreGraphReader:
    mitre_graph: nx.Graph
    link_file_map: dict

    def __init__(self, gml_location: str = r".\Mitre_TTPs\Tactic_Technique_Reference_Example.gml", link_file_map_file:str = r".\data\cti\html\html_url_hash.csv"):
        self.mitre_graph = nx.read_gml(gml_location)
        self.link_file_map = read_csv_as_dict(link_file_map_file)

    def find_examples_for_technique(self, technique_id: str) -> list:
        example_list = []

        for n in self.mitre_graph.neighbors(technique_id):
            if self.mitre_graph.nodes[n]["types"] == "examples":
                example_list.append(n)

        logging.info("---%s have %d examples---" % (technique_id, len(example_list)))
        return example_list

    def find_reports_for_technique(self, technique_id: str) -> list:
        report_link_list = []
        report_file_list = []

        for n in self.mitre_graph.neighbors(technique_id):
            if self.mitre_graph.nodes[n]["types"] == "reference":
                report_link_list.append(n)
                try:
                    report_file_list.append(self.link_file_map[n])
                except:
                    continue

        return report_file_list

    def find_techniques_relatedto_reports(self, report_url: str = r'https://arstechnica.com/information-technology/2020/08/intel-is-investigating-the-leak-of-20gb-of-its-source-code-and-private-data/') -> list:

        involved_technique_list = []

        try:
            for n in self.mitre_graph.neighbors(report_url):
                if "technique" in self.mitre_graph.nodes[n]["types"]:
                    if n in picked_techniques:
                        involved_technique_list.append(n)
        except:
            pass

        return involved_technique_list


# Example Data
# https://wiki.owasp.org/index.php/OAT-004_Fingerprinting, .\data\cti\html\5d69b8d9b672612b77b13e1cb34c80f0.html
def read_csv_as_dict(csv_file: str) -> dict:
    d = {}

    with open(csv_file) as csv_stream:
        csv_reader = csv.reader(csv_stream)
        for row in csv_reader:
            try:
                d[row[1]] = row[0]
            except:
                continue

    return d

# %%

if __name__ == '__main__':
    logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)

    # technique_id = "/techniques/T1059/001"
    # mgr = MitreGraphReader()
    # example_list = mgr.find_examples_for_technique(technique_id)

    # %%

    # technique_id_list = ["/techniques/T1566/001", "/techniques/T1566/002", "/techniques/T1566/003", "/techniques/T1059/001", "/techniques/T1059/003", "/techniques/T1059/005", "/techniques/T1059/007", "/techniques/T1204/001", "/techniques/T1204/002", "/techniques/T1053/005", "/techniques/T1547/001", "/techniques/T1037/001", "/techniques/T1547/001", "/techniques/T1547/002", "/techniques/T1112", "/techniques/T1218/005", "/techniques/T1218/010", "/techniques/T1218/011", "/techniques/T1078/001", "/techniques/T1518/001", "/techniques/T1083", "/techniques/T1057", "/techniques/T1012", "/techniques/T1497/001", "/techniques/T1560/001", "/techniques/T1123", "/techniques/T1119", "/techniques/T1041"]
    # mgr = MitreGraphReader()
    #
    # example_list = []
    # for technique_id in technique_id_list:
    #     example_list += mgr.find_examples_for_technique(technique_id)
    #
    # with open("produce_examples_picked.txt", "w+") as output:
    #     for example in example_list:
    #         output.write(example + "\n")

    # %%

    # link_file_dict = read_csv_as_dict()
    # report_file_list = mgr.find_reports_for_technique(technique_id, link_file_dict)

    #%%

    mgr = MitreGraphReader()
    url_file_name_dict = read_csv_as_dict(csv_file=r'.\data\cti\html\html_url_hash.csv')

    cti_path = r".\data\cti\html"
    with open(r"report_picked_technique.json", "w+") as output:
        report_technique_dict = {}

        for file in os.listdir(cti_path):
            print(file)
            if file not in url_file_name_dict.keys():
                continue

            report_url = url_file_name_dict[file]
            involved_technique_list = mgr.find_techniques_relatedto_reports(report_url)
            print(involved_technique_list)

            report_technique_dict[file] = involved_technique_list
            # output.write(file)
            # output.write(str(involved_technique_list))

        data_json = json.dumps(report_technique_dict)
        output.write(data_json)
