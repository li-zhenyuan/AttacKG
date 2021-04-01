# ============================
# /AttacKG/data/cti/Cybereason Labs Analysis Operation Cobalt Kitty.pdf
# ============================

import networkx
from uuid import uuid3, NAMESPACE_DNS
import matplotlib.pyplot as plt


oceanlotus_kg = networkx.MultiDiGraph()
oceanlotus_namespace = uuid3(NAMESPACE_DNS, 'oceanlotus')

# ============================
# Initial Access - Spearphishing Link
# ============================
# Nodes:
oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'email'),
                        type = 'virtual_entity',
                        entity_type = 'email', # Provenance graph-level
                        entity_regex = '',
                        entity_description = '#spear-phishing emails', # NLP-level
                        cti_instance = '', # CTI-level
                        cti_instance_regex = '',
                        cti_instance_description = ''
                        )

oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'email_client'),
                        type = 'system_entity',
                        entity_type = 'process', # Provenance graph-level
                        entity_regex = '',
                        entity_description = '', # NLP-level
                        cti_instance = '#chrome.exe#outlook.exe', # CTI-level
                        cti_instance_regex = '',
                        cti_instance_description = ''
                        )

oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'link_flash'),
                        type = 'system_entity',
                        entity_type = 'network_location', # Provenance graph-level
                        entity_regex = '',
                        entity_description = '#malicious site', # NLP-level
                        cti_instance = '', # CTI-level
                        cti_instance_regex = '',
                        cti_instance_description = ''
                        )

oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'flash'),
                        type = 'system_entity',
                        entity_type = 'file_executable',
                        entity_regex = '*.exe',
                        entity_description = '#fake Flash Installer',
                        cti_instance = '#install_flashplayers.exe',
                        cti_instance_regex = '',
                        cti_description = ''
                        )

oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'flash_process'),
                        type = 'system_entity',
                        entity_type = 'process',
                        entity_regex = '*.exe',
                        entity_description = '',
                        cti_instance = '',
                        cti_instance_regex = '',
                        cti_description = ''
                        )

# Edges:                    
oceanlotus_kg.add_edge(uuid3(oceanlotus_namespace, 'email'),
                        uuid3(oceanlotus_namespace, 'link_flash'),
                        type = 'virtual_opearation',
                        operation_type = 'contain',
                        operation_description = '#contained'
                        )

oceanlotus_kg.add_edge(uuid3(oceanlotus_namespace, 'email'),
                        uuid3(oceanlotus_namespace, 'email_client'),
                        type = 'virtual_opearation',
                        operation_type = 'opened in',
                        operation_description = ''
                        )

oceanlotus_kg.add_edge(uuid3(oceanlotus_namespace, 'link_flash'),
                        uuid3(oceanlotus_namespace, 'email_client'),
                        type = 'system_opearation',
                        operation_type = 'net_read',
                        operation_description = ''
                        )


oceanlotus_kg.add_edge(uuid3(oceanlotus_namespace, 'flash'),
                        uuid3(oceanlotus_namespace, 'flash_process'),
                        type = 'system_operation',
                        operation_type = 'execute',
                        operation_description = ''
                        )

# Tactics & Techniques
oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'spearphishing_link'),
                        type = 'technique',
                        technique_id = 'T1566.002',
                        technique_name = 'Spearphishing Link'
                        )

for node_id in ['email', 'email_client', 'link_flash', 'flash', 'flash_process']:
    oceanlotus_kg.add_edge(uuid3(oceanlotus_namespace, 'spearphishing_link'),
                            uuid3(oceanlotus_namespace, node_id),
                            type = 'technique_steps',
                            )

# ============================
# Execution - Malicious Link
# ============================
# Nodes:
oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'link_payload'),
                        type = 'system_entity',
                        entity_type = 'network_location', # Provenance graph-level
                        entity_regex = '',
                        entity_description = '#URL', # NLP-level
                        cti_instance = '#http://110.10.179.65:80/ptF2', # CTI-level
                        cti_instance_regex = '',
                        cti_instance_description = ''
                        )

oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'payload'),
                        type = 'system_entity',
                        entity_type = 'file',
                        entity_regex = '',
                        entity_description = '#encrypted payload#',
                        cti_instance = '#microsoft.jpg',
                        cti_instance_regex = '',
                        cti_description = ''
                        )

# Edges:
oceanlotus_kg.add_edge(uuid3(oceanlotus_namespace, 'link_payload'),
                        uuid3(oceanlotus_namespace, 'flash_process'),
                        type = 'system_opearation',
                        operation_type = 'net_read',
                        operation_description = ''
                        )

oceanlotus_kg.add_edge(uuid3(oceanlotus_namespace, 'flash_process'),
                        uuid3(oceanlotus_namespace, 'Payload'),
                        type = 'system_operation',
                        operation_type = 'file_write',
                        operation_description = '#downloads'
                        )

# Tactics & Techniques
oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'malicious_link'),
                        type = 'technique',
                        technique_id = 'T1566.002',
                        technique_name = 'Spearphishing Link'
                        )

for node_id in ['flash_process', 'link_payload', 'payload']:
    oceanlotus_kg.add_edge(uuid3(oceanlotus_namespace, 'malicious_link'),
                            uuid3(oceanlotus_namespace, node_id),
                            type = 'technique_steps',
                            )

# ============================
# Initial Access - Spearphishing Attachment
# ============================
# Nodes:
oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'document'),
                        type = 'system_entity',
                        entity_type = 'file_document',
                        entity_regex = '*.(docx|doc)',
                        entity_description = '#word file#document',
                        cti_instance = '#CV.doc#Complaint_Letter.doc',
                        cti_instance_regex = '',
                        cti_description = ''
                        )

oceanlotus_kg.add_node(uuid3(oceanlotus_namespace, 'macro'),
                        type = 'virtual_entity',
                        entity_type = 'macro', # Provenance graph-level
                        entity_regex = '',
                        entity_description = '#malicious macro', # NLP-level
                        cti_instance = '', # CTI-level
                        cti_instance_regex = '',
                        cti_instance_description = ''
                        )                        

# Edges:
oceanlotus_kg.add_edge(uuid3(oceanlotus_namespace, 'email'),
                        uuid3(oceanlotus_namespace, 'document'),
                        type = 'virtual_opearation',
                        operation_type = 'contain',
                        operation_description = '#contained'
                        )

# ============================
# Visualization
# ============================
pos = networkx.spring_layout(oceanlotus_kg)
networkx.draw(oceanlotus_kg, pos, node_size=200)
node_labels = networkx.get_node_attributes(oceanlotus_kg, 'type')
networkx.draw_networkx_labels(oceanlotus_kg, pos, labels=node_labels)
plt.show()
