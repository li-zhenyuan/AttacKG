from bs4 import BeautifulSoup
from py2neo import Graph, Subgraph, Node, Relationship, NodeMatcher, RelationshipMatcher
from urllib.parse import urlparse
import pandas
import requests
import re
import os


def techniques_csv(url_name_description_list):
    df = pandas.DataFrame(url_name_description_list, columns=['url', 'name', 'description'])
    df.to_csv('./mitre_techniques.csv', sep='#')


def get_all_reference_nodes(graph):
    # cypher = "MATCH (n:References) RETURN n"
    # reference_nodes = graph.run(cypher).data()

    reference_nodes = graph.nodes.match("Reference")

    # node_matcher = NodeMatcher(graph)
    # reference_nodes = node_matcher.match("References")

    return reference_nodes


def rename_reference_nodes(graph, node):
    if str(node.labels) != ":Reference":
        raise Exception("%s is not a reference node!" % node.label)

    u = urlparse(node["url"])
    file_name = os.path.split(u.path)[1]

    group_names = ""
    techniques_names = ""
    relationship_matcher = RelationshipMatcher(graph)
    relationships = relationship_matcher.match((None,node))
    for relationship in relationships:
        n = relationship.start_node
        if str(n.labels) == ":Groups":
            group_names += n["id"]
        elif str(n.labels) == ":Techniques":
            techniques_names += n["id"]

    return group_names + "#" + techniques_names + "#" + file_name # ToDo: the new name is too long!


# ====== modularize ======

class Mitre_Attack_Crawler:

    graph = 0
    trans = 0
    cypher = 0
    url = ""
    root_url = ""
    html = ""

    # {span-id: reference-url}
    reference_span_dict = {}

    def __init__(self, graph, url):
        self.graph = graph
        # self.cypher = graph.cypher
        self.trans = self.graph # ToDo: replace graph with trans for better performance
        self.url = url
        self.root_url = 'attack.mitre.org'

        parse_result = urlparse(url)
        # offline
        if parse_result.netloc == '':
            web = open(url, 'r')
            self.html = web.read()
            web.close()
        # online
        else:
            self.html = requests.get(self.url).text

        # self.trans = self.graph.begin()

    def __del__(self):
        # self.trans.commit()
        pass

    def span_analysis(self, soup):
        spans_soup = soup.find_all('span', {'id':re.compile(r".*")})
        for span in spans_soup:
            id = span.get('id')
            try:
                href = span.find('a', {'href':re.compile(r".*")}).get('href')
                self.reference_span_dict[id] = href
            except:
                continue

    def table_analysis(self, table_soup):
        table_head = []
        table_content = []
        table_content_links = []

        # parse table headers
        table_heads_soup = table_soup.find_all('th')
        for table_head_soup in table_heads_soup:
            table_head.append(table_head_soup.get_text().strip())

        # parse table content and the links in content
        rows_soup = table_soup.find_all('tr')
        for row in rows_soup:
            row_content = []
            row_content_links = []
            cells_soup = row.find_all('td')
            for cell in cells_soup:
                row_content.append(cell.get_text().strip())
                links_soup = cell.find_all('a', {'href':re.compile(r'.*')})
                cell_content_links = []
                for link in links_soup:
                    cell_content_links.append(link.get('href'))
                row_content_links.append(cell_content_links)
            table_content.append(row_content)
            table_content_links.append(row_content_links)

        return table_head, table_content, table_content_links

    # def find_or_create_node(self, label, **properties):
    #     node = self.graph.nodes.match(label, **properties).first()
    #
    #     if node == None:
    #         node = Node(label, **properties)
    #         self.trans.create(node)
    #
    #     return node

    def find_or_create_node(self, label, **properties):
        p_string = ""
        for k,v in properties.items():
            p_string += '%s: "%s"' % (k, v)
        cypher = "MERGE (n:%s {%s}) RETURN n LIMIT 1" % (label, p_string)

        node = self.graph.run(cypher).data()[0]['n']
        return node

    def is_internal_url(self, url):
        try:
            return urlparse(url).netloc == self.root_url
        except:
            return True

    def crawl_techniques(self):
        # url = 'https://attack.mitre.org/techniques/enterprise/'
        # html = requests.get(url)
        # print(html.text)

        soup = BeautifulSoup(self.html, 'html.parser')

        url_name_description_list = []

        table = soup.find('table', {'class': 'table-techniques'})
        table_body = table.find('tbody')

        rows = table_body.find_all('tr')
        for row in rows:
            cells = row.find_all('td')
            # print(cells)

            url = cells[len(cells) - 3].find('a')['href']
            # id = cells[len(cells)-3].find('a').get_text()
            name = cells[len(cells) - 2].find('a').get_text().strip()
            description = cells[len(cells) - 1].get_text().strip()

            # ToDo: techniques_crossrefs = cells[len(cells)-1].find_all('a')['href']

            url_name_description = [url, name, description]
            url_name_description_list.append(url_name_description)
            print(url_name_description)

        return url_name_description_list

    def techniques_neo4j(self, url_name_description_list):
        # techniques_nodes_list = []
        for url_name_description in url_name_description_list:
            uid = urlparse(url_name_description[0]).path
            techniques_nodes = Node('Techniques', id=uid, name=url_name_description[1],
                                    description=url_name_description[2])
            self.trans.create(techniques_nodes)
        #     techniques_nodes_list.append(techniques_nodes)
        # graph.create(Subgraph(nodes=techniques_nodes_list))

    def crawl_groups(self):
        # if re.search('attack.mitre.org/groups/.+', self.url, flags=re.I) == None:
        #     raise Exception("%s is not a attack groups url!" % self.url)

        # ToDo: get group_id automatically
        # group_id = re.findall(r"/groups/.+$", self.url, flags=re.I)[0]
        group_id = "/groups/G0050/"

        soup = BeautifulSoup(self.html, 'html.parser')
        # self.span_analysis(soup)

        table_soup_list = soup.find_all('table', {'class':re.compile(r".*")})
        parsed_table_list = []

        for table_soup in table_soup_list:
            print(table_soup.get('class'))
            head, content, links = self.table_analysis(table_soup)
            parsed_table_list.append((head, content, links))

        self.connect_groups_techniques(group_id, parsed_table_list[1][1], parsed_table_list[1][2])

    def connect_groups_techniques(self, group_id, content, links):
        # group_node = self.find_or_create_node("Groups", id=group_id)
        # TODO: Define function to add nodes and relationships.
        # group_node = self.graph.nodes.match("Groups", id=group_id).first()
        # if group_node == None:
        # group_node = Node("Groups", id=group_id)
        group_node = self.find_or_create_node("Groups", id=group_id)
        # self.trans.create(group_node)

        for i in range(1, len(content)):
            techniques_url = links[i][-2][-1]
            techniques_id = re.search('/techniques/.+', techniques_url, flags=re.I)[0]
            # techniques_node = self.graph.nodes.match("Techniques", id=techniques_id).first()
            techniques_node = self.find_or_create_node("Techniques", id=techniques_id)

            operation = content[i][-1]
            group_techniques = Relationship(group_node, "used", techniques_node, operation=operation)
            self.trans.create(group_techniques)

            for link in links[i][-1]:
                if not self.is_internal_url(link):
                    reference_node = self.find_or_create_node("Reference", url=link)

                    group_reference = Relationship(group_node, 'refer', reference_node)
                    techniques_reference = Relationship(techniques_node, 'refer', reference_node)
                    self.trans.create(group_reference)
                    self.trans.create(techniques_reference)
