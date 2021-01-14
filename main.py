from py2neo import Graph, Node

from knowledge_graph import mitre_attack_metagraph
from reports_crawler.mitre_attack import *

def drop_all(graph):
    graph.run('match (n) detach delete n')

if __name__ == '__main__':

    graph = Graph(host='localhost', auth=('neo4j', '950727'))
    # mitre_attack_metagraph.create_metagraph(graph)

    # techniques_csv(crawl_techniques())
    # techniques_neo4j(graph, crawl_techniques())

    url = 'https://attack.mitre.org/groups/G0050/'
    crawler = Mitre_Attack_Crawler(graph, url)
    crawler.crawl_groups()




