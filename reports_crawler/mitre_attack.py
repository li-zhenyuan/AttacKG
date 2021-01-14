from bs4 import BeautifulSoup
from py2neo import Graph, Subgraph, Node, Relationship, NodeMatcher, RelationshipMatcher
from urllib.parse import urlparse
import pandas
import requests
import re

def techniques_csv(url_name_description_list):
    df = pandas.DataFrame(url_name_description_list, columns=['url', 'name', 'description'])
    df.to_csv('./mitre_techniques.csv', sep='#')

def techniques_neo4j(graph, url_name_description_list):
    techniques_nodes_list = []
    for url_name_description in url_name_description_list:
        techniques_nodes = Node('Techniques', id=url_name_description[0], name=url_name_description[1], description=url_name_description[2])
        techniques_nodes_list.append(techniques_nodes)
    graph.create(Subgraph(nodes=techniques_nodes_list))

def crawl_techniques():
    url = 'https://attack.mitre.org/techniques/enterprise/'
    html = requests.get(url)
    # print(html.text)

    soup = BeautifulSoup(html.text, 'html.parser')

    url_name_description_list = []

    table = soup.find('table', {'class':'table-techniques'})
    table_body = table.find('tbody')

    rows = table_body.find_all('tr')
    for row in rows:
        cells = row.find_all('td')
        # print(cells)

        url = cells[len(cells)-3].find('a')['href']
        # id = cells[len(cells)-3].find('a').get_text()
        name = cells[len(cells)-2].find('a').get_text().strip()
        description = cells[len(cells)-1].get_text().strip()

        # ToDo: techniques_crossrefs = cells[len(cells)-1].find_all('a')['href']

        url_name_description = [url, name, description]
        url_name_description_list.append(url_name_description)
        print(url_name_description)

    return url_name_description_list


# ====== modularize ======

class Mitre_Attack_Crawler:

    graph = 0
    trans = 0
    url = ""
    root_url = ""

    # {span-id: reference-url}
    reference_span_dict = {}

    def __init__(self, graph, url):
        self.graph = graph
        self.url = url

        self.root_url = urlparse(url).netloc

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

    def find_or_create_node(self, label, **properties):
        node = self.graph.nodes.match(label, **properties).first()

        if node == None:
            node = Node(label, **properties)
            self.trans.create(node)

        return node

    def is_internal_url(self, url):
        try:
            return urlparse(url).netloc == self.root_url
        except:
            return True

    def connect_groups_techniques(self, group_id, content, links):
        self.trans = self.graph.begin()

        # group_node = self.find_or_create_node("Groups", id=group_id)
        # TODO: Define function to add nodes and relationships.
        # group_node = self.graph.nodes.match("Groups", id=group_id).first()
        # if group_node == None:
        group_node = Node("Groups", id=group_id)
        self.trans.create(group_node)

        for i in range(1, len(content)):
            techniques_url = links[i][-2][-1]
            techniques_id = re.search('/techniques/.+', techniques_url, flags=re.I)[0]
            techniques_node = self.graph.nodes.match("Techniques", id=techniques_id).first()

            operation = content[i][-1]
            group_techniques = Relationship(group_node, "used", techniques_node, operation=operation)
            self.trans.create(group_techniques)

            for link in links[i]:
                if not self.is_internal_url(link):
                    reference_node = self.find_or_create_node("Reference", url=link)

                group_reference = Relationship(group_node, 'refer', reference_node)
                techniques_reference = Relationship(techniques_node, 'refer', reference_node)
                self.trans.create(group_reference)
                self.trans.create(techniques_reference)

        self.trans.commit()

    def crawl_groups(self):
        if re.search('attack.mitre.org/groups/.+', self.url, flags=re.I) == None:
            raise Exception("%s is not a attack groups url!" % self.url)

        group_id = re.findall(r"/groups/.+$", self.url, flags=re.I)[0]

        html = requests.get(self.url)
        soup = BeautifulSoup(html.text, 'html.parser')

        # self.span_analysis(soup)

        table_soup_list = soup.find_all('table', {'class':re.compile(r".*")})
        parsed_table_list = []

        for table_soup in table_soup_list:
            print(table_soup.get('class'))
            head, content, links = self.table_analysis(table_soup)
            parsed_table_list.append((head, content, links))

        self.connect_groups_techniques(group_id, parsed_table_list[1][1], parsed_table_list[1][2])
