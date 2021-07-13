import networkx as nx
import logging
import sys
import csv


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

# Example Data
# https://wiki.owasp.org/index.php/OAT-004_Fingerprinting, .\data\cti\html\5d69b8d9b672612b77b13e1cb34c80f0.html
def read_csv_as_dict(csv_file: str) -> dict:
    d = {}

    with open(csv_file) as csv_stream:
        csv_reader = csv.reader(csv_stream)
        for row in csv_reader:
            try:
                d[row[0]] = row[1]
            except:
                continue

    return d

# %%

if __name__ == '__main__':
    logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)

    technique_id = "/techniques/T1059/001"
    mgr = MitreGraphReader()
    example_list = mgr.find_examples_for_technique(technique_id)
    link_file_dict = read_csv_as_dict()
    report_file_list = mgr.find_reports_for_technique(technique_id, link_file_dict)