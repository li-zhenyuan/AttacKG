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

    # def edge_alignment(self, edge: set, nx_graph: nx.DiGraph):
    #     print(edge)

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

            edge_matching_score = source_node_matching_score * sink_node_matching_score * math.sqrt(instance_count) / distance
            self.edge_match_record[template_edge] = edge_matching_score

    def get_graph_alignment_score(self):
        return self.get_node_alignment_score() + self.get_edge_alignment_score()

    def get_node_alignment_score(self):
        node_alignment_score = 0.0

        index = 0
        for node_index, node_similarity in self.node_match_record.items():
            if self.technique_template.technique_node_list[node_index].node_type == "actor":
                continue

            if node_similarity is not None:
                node_alignment_score += node_similarity[1] * self.technique_template.technique_node_list[node_index].instance_count  # math.sqrt
                logging.debug("%d-%s-%f" % (index, node_similarity[0], node_alignment_score))

            index += 1

        # Normalization
        node_alignment_score /= self.node_count + 1  # math.sqrt(self.node_count + 1)
        return node_alignment_score

    def get_edge_alignment_score(self):
        edge_alignment_score = 0.0

        for edge, edge_similarity in self.edge_match_record.items():
            edge_alignment_score += edge_similarity * math.sqrt(self.technique_template.technique_edge_dict[edge])

        edge_alignment_score /= self.edge_count + 1
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
                node_alignment_score = technique_identifier.get_graph_alignment_score() / self.normalized_factor

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


class EvaluationA:

    def __init__(self):
        matching_result = []

    def example_matching(self, example_graph_path: str, template_path: str):
        pass


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
        technique_list.append(filename)
        tt.load_from_file(os.path.join(tt_path, tt_file))
        ti = TechniqueIdentifier(tt)
        identifier_list.append(ti)

    xe = Evaluation()
    xe.add_technique_list(technique_list)

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
    for file in os.listdir(r"./data/procedure_examples"):
        file_name, ext = os.path.splitext(file)
        if ext != ".gml":
            continue

        example_graph = nx.read_gml(r"./data/procedure_examples/" + file)
        # if len(example_graph.nodes()) <= 1:
        #     continue

        am = AttackMatcher(example_graph)
        for ti in identifier_list:
            am.add_technique_identifier(ti)
        am.attack_matching()
        matching_result = am.print_match_result()

        xe.add_result(file_name, matching_result, [])

    # xe.book.save()
    xe.book.close()
