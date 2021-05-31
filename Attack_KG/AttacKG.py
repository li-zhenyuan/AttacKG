

class AttacKG_Node:
    node_summary = ""

    regexs = []
    descriptions = []

    # ToDo: Check if one node belong to this type.
    def node_check(self, node: dict) -> float:
        similarity = 0.0
        return similarity

    # ToDo: update node representation
    def node_update(self, node: dict):
        pass

class AttacKG_AG:
    technique_name = ""

    nodes = {} # node representation -> confidence score
    edge_sets = {} # (node_a, node_b) -> confidence score

class AttacKG_TG:
    akg_version = 0.1

    t_nodes = []
    t_edges = {} # (node_a, node_b) -> (confidence score, connection)


def init_akg_template() -> AttacKG_TG:
    akg = AttacKG_TG

    return akg

if __name__ == '__main__':
    init_akg_template()
