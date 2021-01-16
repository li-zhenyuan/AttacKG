from graphviz import Digraph

type_show_in_graph = {
    ":Groups": "id",
    ":Techniques": "name",
    ":Reference": "url"
}


def get_subgraph(graph, cypher="MATCH (n)-[r]-(m) RETURN r"):
    subgraph = graph.run(cypher).data()
    return subgraph


def get_neibor_subgraph(graph, label, **properties):
    p_string = ""
    for k,v in properties.items():
        p_string += '%s: "%s"' % (k, v)

    cypher = "MATCH (n:%s {%s})-[r]-(m) RETURN r" % (label, p_string)
    relations = graph.run(cypher).data()

    # for relation in relations:
    #     start = relation['r'].start_node
    #     end = relation['r'].end_node

    return relations


def draw_dotgraph_from_relations(relations, graph_path="./dot"):
    dot = Digraph()

    for relation in relations:
        start = relation['r'].start_node
        start_id = str(start.identity)
        dot.node(start_id, start[type_show_in_graph[str(start.labels)]])

        end = relation['r'].end_node
        end_id = str(end.identity)
        dot.node(end_id, end[type_show_in_graph[str(end.labels)]])

        dot.edge(start_id, end_id)

    dot.format = "pdf"
    dot.render(graph_path)