from py2neo import Graph, Node

from knowledge_graph import mitre_attack_metagraph, kg_visualization
from reports_crawler.mitre_attack import *

graph = Graph(host='localhost', auth=('neo4j', 'academy-neptune-book-manila-spring-2014'))


def drop_all(graph):
    graph.run('match (n)-[r]-(m) delete r')
    graph.run('match (n) detach delete n')


def crawl():
    # mitre_attack_metagraph.create_metagraph(graph)

    # techniques_csv(crawl_techniques())
    techniques_local_url = '/mnt/c/Users/wan/Documents/AttacKG/data/html/Techniques-Enterprise.html'
    crawler = Mitre_Attack_Crawler(graph, techniques_local_url)
    crawler.techniques_neo4j(crawler.crawl_techniques())

    url = 'https://attack.mitre.org/groups/G0050/'
    local_url = '/mnt/c/Users/wan/Documents/AttacKG/data/html/Groups-APT32.html'
    crawler = Mitre_Attack_Crawler(graph, local_url)
    crawler.crawl_groups()


def draw():
    # relations = kg_visualization.get_neibor_subgraph(graph, "Groups", id="/groups/G0050/")
    relations = kg_visualization.get_subgraph(graph)
    kg_visualization.draw_dotgraph_from_relations(relations, '/mnt/c/Users/wan/Documents/AttacKG/data/graph/G0050')


if __name__ == '__main__':
    draw()




