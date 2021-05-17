import spacy
import random
import json

labeled_data = []
spacy_data = []

# Data Preparation
# with open(r"/home/zhenyuan/AttacKG/NLP/Doccano/admin.jsonl", "r") as read_file:
#     for line in read_file:
#         data = json.loads(line)
#         labeled_data.append(data)
#         if "label" in line:
#             data["entities"] = data.pop("label")
#         else:
#             data["entities"] = []
#
#         tmp_ents = []
#         for e in data["entities"]:
#             #             if e[2] in ['APTFamily', 'ExeFile', 'ScriptsFile']
#             tmp_ents.append({"start": e[0], "end": e[1], "label": e[2]})
#
#             data["entities"] = tmp_ents
#
#         if len(data["data"]) > 5:
#             spacy_line = json.dumps({"entities": data["entities"], "text": data["data"]})
#             spacy_data.append(spacy_line)
#             print(spacy_line)

labeled_data = []
with open(r"/home/zhenyuan/AttacKG/NLP/Doccano/admin.jsonl", "r") as read_file:
    for line in read_file:
        data = json.loads(line)
        labeled_data.append(data)

spacy_data = []
for entry in labeled_data:
    entities = []
    for e in entry['label']:
        entities.append((e[0], e[1], e[2]))
    spacy_entry = (entry['data'], {"entities": entities})
    spacy_data.append(spacy_entry)

# split training and testing set
training_set = spacy_data[0:19]
testing_set = spacy_data[20:-1]

# Start training
nlp = spacy.blank("en")
ner = nlp.add_pipe("ner")
ner.add_label("NetLoc")
ner.add_label("APTFamily")
ner.add_label("ExeFile")
ner.add_label("ScriptsFile")
ner.add_label("DocumentFile")
ner.add_label("E-mail")
ner.add_label("Registry")
ner.add_label("File")
ner.add_label("Vulnerability")
ner.add_label("C2C")
ner.add_label("SensInfo")
ner.add_label("Service")

nlp.begin_training()

# Loop
for itn in range(4):
    random.shuffle(training_set)
    losses = ()

    # Batch the examples
    for batch in spacy.util.minibatch(training_set, size=2):
        texts = [data for text, entities in batch]
        annotations = [entities for text, entities in batch]

        # Update the model
        nlp.update((texts, annotations), losses=losses, drop=0.3)
        print(losses)

nlp.to_disk("cti.model")