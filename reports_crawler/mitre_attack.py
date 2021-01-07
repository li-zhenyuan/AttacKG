from bs4 import BeautifulSoup
from py2neo import Graph, Subgraph, Node, Relationship
import pandas
import requests
import re

def techniques_csv(url_name_description_list):
    df = pandas.DataFrame(url_name_description_list, columns=['url', 'name', 'description'])
    df.to_csv('./mitre_techniques.csv', sep='#')

def techniques_neo4j(graph, url_name_description_list):
    techniques_nodes_list = []
    for url_name_description in url_name_description_list:
        techniques_nodes = Node(url_name_description[0], name=url_name_description[1], description=url_name_description[2])
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

        # ToDo
        # techniques_crossrefs = cells[len(cells)-1].find_all('a')['href']

        url_name_description = [url, name, description]
        url_name_description_list.append(url_name_description)
        print(url_name_description)

    return url_name_description_list


# ====== modularize ======

class Mitre_Attack_Crawler:

    # {span-id: reference-url}
    reference_span_dict = {}

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

        return table_head, table_content

    def crawl_groups(self, url):
        if re.search('attack.mitre.org/groups/.+', url,flags=re.I) == None:
            raise Exception("%s is not a attack groups url!" % url)

        html = requests.get(url)
        soup = BeautifulSoup(html.text, 'html.parser')

        # self.span_analysis(soup)

        table_soup_list = soup.find_all('table', {'class':re.compile(r".*")})
        for table_soup in table_soup_list:
            print(table_soup.get('class'))
            self.table_analysis(table_soup)
