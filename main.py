from py2neo import Graph, Node

from knowledge_graph import mitre_attack_metagraph
from reports_crawler.mitre_attack import *

def drop_all(graph):
    graph.run('match (n) detach delete n')

if __name__ == '__main__':

    graph = Graph(host='localhost', auth=('neo4j', 'academy-neptune-book-manila-spring-2014'))
    # mitre_attack_metagraph.create_metagraph(graph)

    # techniques_csv(crawl_techniques())
    # techniques_local_url = '/mnt/c/Users/wan/Documents/AttacKG/data/html/Techniques-Enterprise.html'
    # crawler = Mitre_Attack_Crawler(graph, techniques_local_url)
    # crawler.techniques_neo4j(crawler.crawl_techniques())

    url = 'https://attack.mitre.org/groups/G0050/'
    local_url = '/mnt/c/Users/wan/Documents/AttacKG/data/html/Groups-APT32.html'
    crawler = Mitre_Attack_Crawler(graph, local_url)
    crawler.crawl_groups()




