from py2neo import Graph, Node

from knowledge_graph import mitre_attack_metagraph
from reports_crawler import mitre_attack

def drop_all(graph):
    graph.run('match (n) detach delete n')

if __name__ == '__main__':

    # graph = Graph(host='localhost', auth=('neo4j', '950727'))
    # mitre_attack_metagraph.create_metagraph(graph)

    mitre_attack.crawl_techniques()




