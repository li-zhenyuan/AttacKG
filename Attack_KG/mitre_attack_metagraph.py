from py2neo import Graph, Subgraph, Node, Relationship

# Extracted from https://attack.mitre.org/
def create_metagraph(graph):
    # TTPs
    tactics = Node('Tactics', type='MetaNode')
    techniques = Node('Techniques', type='MetaNode')
    produces = Node('Produces', type='MetaNode') # Need to be extracted from CTI reports

    # Attackers
    groups = Node('Groups', type='MetaNode')
    softwares = Node('Software', type='MetaNode')

    # Defenders
    mitigations = Node('Mitigations', type='MetaNode')

    # Relationships
    tactics_techniques = Relationship(tactics, 'consist of',techniques ,type='MetaRelation')
    produces_tactics = Relationship(produces, 'consist of', tactics, type='MetaRelation')
    produces_softwares = Relationship(produces, 'use', softwares, type='MetaRelation')
    produces_techniques = Relationship(produces, 'use', techniques, type='MetaRelation')

    groups_techniques = Relationship(groups, 'use', techniques, type='MetaRelation')
    groups_softwares = Relationship(groups, 'use', softwares, type='MetaRelation')
    softwares_techniques = Relationship(softwares, 'use', techniques, type='MetaRelation')

    mitigations_techniques = Relationship(mitigations, 'address', techniques, type='MetaRelation')

    # Create Metagraph
    metagraph = Subgraph(nodes=[tactics, techniques, groups, mitigations],
                         relationships=[tactics_techniques, produces_tactics, produces_softwares, produces_techniques,
                                        groups_techniques, groups_softwares, softwares_techniques, mitigations_techniques])
    graph.create(metagraph)


