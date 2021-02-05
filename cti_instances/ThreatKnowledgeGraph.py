# We try to build the "Next Generation of Threat Intelligence", with which we can perform much more effective threat detection and investigation.
# The "Threat Knowledge Graph(Database)" is at the core of the "Next Generation of Threat Intelligence" project.
# The "Threat Knowledge Graph(Database)" store pruned provenance graphs of all kind of attacks.

from enum import Enum
from uuid import uuid1
import json
from graphviz import Digraph # conda install python-graphviz



def Entity2Json(entity):
    return {
        "uuid": entity.uuid,
        "types": entity.types
    }

def Json2Entity(json):
    return Entity(uuid=json['uuid'], types=json["types"])




def Activity2Json(activity):
    return {
        "uuid": activity.uuid,
        "types": activity.types,
        "source_uuid": activity.source,
        "destination_uuid": activity.destination,
        # "source_uuid": activity.source.uuid,
        # "destination_uuid": activity.destination.uuid,
    }

def Json2Activity(json):
    return Activity(uuid=json['uuid'], types=json["types"], source=json["source_uuid"], destination=json["destination_uuid"])

# ============== Attack Sample ============== #
attackSample = [
    '{"uuid": 4, "types": 2}',
    '{"uuid": 3, "types": 2}',
    '{"uuid": 1, "types": 2, "source_uuid": 3, "destination_uuid": 4}'
]

attackSample_v02 = """
    {
        "NGCTI_version": "v0.2",
        "uuid": "142f4a50-8d0d-11ea-8e1b-f45c89a99081",
        "attack_description": "Darpa E5 establish C&C connection",
        "reference_url": "http://118.126.94.181/magicshield/linux-framework/detector/wikis/Data-set/Engagement-5-attack-campaign-analysis",
        "entity_list": [
            {
                "uuid": "96f2ddb6-8d0e-11ea-8e1b-f45c89a99081",
                "types": "process",
                "properties": {
                    "process_name": "firefox",
                    "path": "/home/admin",
                    "privilege": "null"
                }
            },
            {
                "uuid": "3daecccc-8d10-11ea-8e1b-f45c89a99081",
                "types": "process",
                "properties": {
                    "process_name": "firefox",
                    "path": "/home/admin",
                    "privilege": "null"
                }
            },
            {
                "uuid": "73c75f00-8d0f-11ea-8e1b-f45c89a99081",
                "types": "socket",
                "properties": {
                    "local_address": "128.55.12.118",
                    "local_port": 52012,
                    "remote_address": "35.106.122.76",
                    "remote_port": 80
                }
            },
            {
                "uuid": "6d0258e0-8d10-11ea-8e1b-f45c89a99081",
                "types": "socket",
                "properties": {
                    "local_address": "128.55.12.118",
                    "local_port": 39746,
                    "remote_address": "69.155.209.87",
                    "remote_port": 80
                }
            }
        ],
        "activity_list": [
            {
                "uuid": "0f2c0596-8d23-11ea-8e1b-f45c89a99081",
                "source": "142f4a50-8d0d-11ea-8e1b-f45c89a99081",
                "destination": "73c75f00-8d0f-11ea-8e1b-f45c89a99081",
                "sequence": 1, 
                "types": "connect",
                "properties": {

                }
            },
            {
                "uuid": "9b6132ca-8d23-11ea-8e1b-f45c89a99081",
                "source": "73c75f00-8d0f-11ea-8e1b-f45c89a99081",
                "destination": "142f4a50-8d0d-11ea-8e1b-f45c89a99081",
                "sequence": 2, 
                "types": "send_msg",
                "properties": {

                }
            },            
            {
                "uuid": "fd378076-8d23-11ea-8e1b-f45c89a99081",
                "source": "142f4a50-8d0d-11ea-8e1b-f45c89a99081",
                "destination": "73c75f00-8d0f-11ea-8e1b-f45c89a99081",
                "sequence": 3, 
                "types": "recv_msg",
                "properties": {

                }
            },
            {
                "uuid": "c48808ee-8d24-11ea-8e1b-f45c89a99081",
                "source": "96f2ddb6-8d0e-11ea-8e1b-f45c89a99081",
                "destination": "3daecccc-8d10-11ea-8e1b-f45c89a99081",
                "sequence": 4, 
                "types": "clone",
                "properties": {

                }
            },
                        {
                "uuid": "4efe7124-8d26-11ea-8e1b-f45c89a99081",
                "source": "3daecccc-8d10-11ea-8e1b-f45c89a99081",
                "destination": "6d0258e0-8d10-11ea-8e1b-f45c89a99081",
                "sequence": 5, 
                "types": "connect",
                "properties": {

                }
            },
            {
                "uuid": "5790889a-8d26-11ea-8e1b-f45c89a99081",
                "source": "3daecccc-8d10-11ea-8e1b-f45c89a99081",
                "destination": "6d0258e0-8d10-11ea-8e1b-f45c89a99081",
                "sequence": 6, 
                "types": "send_msg",
                "properties": {

                }
            },            
            {
                "uuid": "5e987eea-8d26-11ea-8e1b-f45c89a99081",
                "source": "6d0258e0-8d10-11ea-8e1b-f45c89a99081",
                "destination": "3daecccc-8d10-11ea-8e1b-f45c89a99081",
                "sequence": 7, 
                "types": "recv_msg",
                "properties": {

                }
            }
        ]
    }
"""
# ============== ============= ============== #

# Provenance graph for all the Cyber Threat Intelligence, which may cotain multiple attack
class ProvGraph:
    entityList = list()
    activityList = list()

    def __init__(self):
        super().__init__()

    def __init__(self, entityCount, activityCount, jsonStrList):
        self.Deserialization((entityCount, activityCount, jsonStrList))

    def __str__(self):
        output = ""
        jsonStrList = self.Serialization()
        for json in jsonStrList:
            output += str(json)

        return output

    def Serialization(self):
        jsonStrList = []
        entityCount = 0
        activityCount = 0

        for entity in self.entityList:
            jsonStrList.append(json.dumps(entity, default=Entity2Json))
            entityCount += 1
        
        for activity in self.activityList:
            jsonStrList.append(json.dumps(activity, default=Activity2Json))
            activityCount += 1

        return (entityCount, activityCount, jsonStrList) #jsonTuple 

    def Deserialization(self, jsonTuple):
        jsonStrList = jsonTuple[2]
        entityCount = jsonTuple[0]
        activityCount = jsonTuple[1]

        for i in range(0, entityCount):
            self.entityList.append(json.loads(jsonStrList[i], object_hook=Json2Entity))
        for i in range(entityCount, entityCount+activityCount):
            self.activityList.append(json.loads(jsonStrList[i], object_hook=Json2Activity))

    def DrawGraph(self):
        dot = Digraph()
        
        for entity in self.entityList:
            dot.node(str(entity.uuid), label=str(entity.types))

        for activity in self.activityList:
            dot.edge(str(activity.source), str(activity.destination), label=str(activity.types))
        
        dot.format = 'png'
        dot.render('output-graph')


if __name__ == "__main__":
    pg = ProvGraph(2, 1, attackSample)
    print(pg)
    pg.DrawGraph()
    pass