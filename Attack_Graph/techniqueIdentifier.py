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
        pass

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

    def get_node_alignment_score(self):
        node_alignment_score = 0.0

        index = 0
        for k, v in self.node_match_record.items():
            if v is not None:
                node_alignment_score += v[1] * math.sqrt(self.technique_template.technique_node_list[k].instance_count)
                logging.debug("%d-%s-%f" % (index, v[0], node_alignment_score))

            index += 1

        # Normalization
        # node_alignment_score /= math.sqrt(self.node_count)

        return node_alignment_score


# Matching process, involve multiple TechniqueIdentifier at one time
class AttackMatcher:
    attack_graph_nx: nx.DiGraph
    technique_identifier_list: list
    technique_matching_result: dict

    def __init__(self, nx_graph: nx.DiGraph):
        self.attack_graph_nx = nx_graph
        self.technique_identifier_list = []
        self.technique_matching_result = {}

    def add_technique_identifier(self, technique_identifier: TechniqueIdentifier):
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
            matching_result = []

            for technique_identifier in self.technique_identifier_list:
                technique_identifier.init_node_match_record()

            for node in subgraph:
                # Try to find a match in technique_identifier_list
                for technique_identifier in self.technique_identifier_list:
                    technique_identifier.node_alignment(node, nx_graph)
            # for edge in subgraph.edges():
            # find the most match technique

            for technique_identifier in self.technique_identifier_list:
                node_alignment_score = technique_identifier.get_node_alignment_score()

                if technique_identifier.technique_template.technique_name not in self.technique_matching_result.keys():
                    self.technique_matching_result[technique_identifier.technique_template.technique_name] = node_alignment_score
                elif self.technique_matching_result[technique_identifier.technique_template.technique_name] < node_alignment_score:
                    self.technique_matching_result[technique_identifier.technique_template.technique_name] = node_alignment_score

                matching_result.append((technique_identifier.technique_template, node_alignment_score))
                logging.debug("---S3.2: matching result %s - %f!---" % (technique_identifier.technique_template.technique_name, node_alignment_score))

    def print_match_result(self) -> dict:
        logging.info(str(self.technique_matching_result))

        return self.technique_matching_result


class Evaluation:

    def __init__(self):
        self.book = xlsxwriter.Workbook("technique_matching_result.xlsx")
        self.sheet = self.book.add_worksheet('report_pickTechnique')
        self.colum_count = 1

        self.match_format = self.book.add_format({'bg_color': '#FFC7CE', 'font_color': '#9C0006'})

    def add_result(self, report_name: str, detection_result: dict, ground_truth: list):
        self.sheet.write(self.colum_count, 0, report_name)

        row_count = 1
        for technique, result in detection_result.items():
            self.sheet.write(self.colum_count, row_count, result)
            technique_name = technique.replace("'", "").replace("_", "/")
            if technique_name in ground_truth:
                self.sheet.conditional_format(self.colum_count, row_count, self.colum_count, row_count, {'type': '2_color_scale'})
            row_count += 1

        self.colum_count += 1


# %%

if __name__ == '__main__':
    # logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)
    logging.basicConfig(filename="running_time_log.txt", filemode='a', level=logging.INFO)
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

    tt_path = r".\data\technique_template"
    tt_file_list = os.listdir(tt_path)
    identifier_list = []
    for tt_file in tt_file_list:
        filename, ext = os.path.splitext(tt_file)
        if ext != ".json":
            continue
        tt = TechniqueTemplate(filename)
        tt.load_from_file(os.path.join(tt_path, tt_file))
        ti = TechniqueIdentifier(tt)
        identifier_list.append(ti)

    # %%
    with open(r"report_picked_technique.json", "r") as output:
        data_json = output.read()
        report_technique_dict = json.loads(data_json)

    xe = Evaluation()

    for report, technique in report_technique_dict.items():
        report_name, ext = os.path.splitext(report)
        report_graph_file = r".\data\\extracted_attackgraph_20210804\%s.gml" % report_name
        logging.info(report_graph_file)

        report_graph_nx = nx.read_gml(report_graph_file)
        am = AttackMatcher(report_graph_nx)
        for ti in identifier_list:
            am.add_technique_identifier(ti)
        am.attack_matching()
        matching_result = detection_result = am.print_match_result()
        xe.add_result(report, matching_result, technique)

    # xe.book.save()
    xe.book.close()
