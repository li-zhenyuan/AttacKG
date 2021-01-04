import requests
from bs4 import BeautifulSoup
import pandas
from py2neo import Graph, Subgraph, Node, Relationship

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

    url_name_description_list = []
    soup = BeautifulSoup(html.text, 'html.parser')

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


