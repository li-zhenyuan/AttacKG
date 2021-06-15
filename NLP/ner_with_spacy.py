# %%

# References:
# https://towardsdatascience.com/custom-named-entity-recognition-using-spacy-7140ebbb3718
# https://spacy.io/usage/training#api

import spacy
from spacy import displacy
from spacy.training import Example
from spacy.pipeline import EntityRuler
from spacy.lang.en import English
import random
import json
import sys
import matplotlib.pyplot as plt
import networkx

sys.path.append("..")
from Attack_KG.AttacKG import AttacKG_AG


# %%

ner_labels = ["NetLoc", "APTFamily", "ExeFile", "ScriptsFile", "DocumentFile", "E-mail", "Registry", "File", "Vulnerability", "C2C", "SensInfo", "Service"]
# ner_labels = ["FilePath", "NetLoc", "FileName", "Vulnerability", "Registry", "Attacker", "ExeFile", "DocFIle","Service"]

class NER_With_Spacy:
    # nlp = spacy.blank("en")
    # nlp = spacy.load("en_core_web_sm") # python -m spacy download en_core_web_sm

    model_location = None
    # model_location = "/home/zhenyuan/AttacKG/NLP/cti.model"

    nlp = None
    optimizer = None

    def __init__(self, model_location=None):
        self.model_location = model_location

        if self.model_location is None:
            self.nlp = spacy.blank('en')
            print("---Created Blank 'en' Model!---")
        else:
            self.nlp = spacy.load(self.model_location)
            print("---Load Model: %s!---" % self.model_location)

        self.create_optimizer()

    def read_labeled_data(self, path: str) -> list:
        # labeled_data_path = r"/home/zhenyuan/AttacKG/NLP/Doccano/admin.jsonl"
        labeled_data_path = path
        labeled_data = []
        with open(labeled_data_path, "r") as read_file:
            for line in read_file:
                data = json.loads(line)
                labeled_data.append(data)

        print('---Read Labeled Data(%d)!---' % len(labeled_data))
        return labeled_data

    def convert_data_format(self, labeled_data: list) -> list:
        # Data format converting
        spacy_data = []
        for entry in labeled_data:
            entities = []
            for e in entry['label']:
                entities.append((e[0], e[1], e[2]))
            try:
                spacy_data.append(Example.from_dict(self.nlp.make_doc(entry['data']), {"entities": entities}))
            except:
                print("Wrong format: %s!" % entry['data'])
        return spacy_data

    def create_optimizer(self):
        if 'ner' not in self.nlp.pipe_names:
            ner = self.nlp.add_pipe("ner")
        else:
            ner = self.nlp.get_pipe("ner")
        print("---Add Pipe 'ner'!---")

        for label in ner_labels:
            ner.add_label(label)

        if self.model_location is None:
            self.optimizer = self.nlp.begin_training()
        else:
            self.optimizer = ner.create_optimizer()
        print("---Created Optimizer!---")

    def train_model(self, spacy_data: list, new_model_location="./new_cti.model"):
        # Start training
        print("---Start Training!---")
        # new_model_location = "/home/zhenyuan/AttacKG/NLP/new_cti.model"

        # Loop
        other_pipes = [pipe for pipe in self.nlp.pipe_names if pipe != 'ner']
        with self.nlp.disable_pipes(*other_pipes):
            for itn in range(4):
                random.shuffle(spacy_data)
                losses = ()

                # Batch the examples
                for batch in spacy.util.minibatch(spacy_data, size=2):
                    # Update the model
                    self.nlp.update(batch, sgd=self.optimizer)  # , drop=0.35, losses=losses
                    # print('Losses', losses)

        self.nlp.to_disk(new_model_location)
        print("---Save Model to %s!---" % new_model_location)

    def test_model(self,
                   sample: str = "APT3 has used PowerShell on victim systems to download and run payloads after exploitation."):
        # nlp = spacy.load(new_model_location)
        doc = self.nlp(sample)
        displacy.render(doc, style='ent')

    # https://stackoverflow.com/questions/57667710/using-regex-for-phrase-pattern-in-entityruler
    # https://python.plainenglish.io/a-closer-look-at-entityruler-in-spacy-rule-based-matching-44d01c43fb6
    patterns = [
        {"label": "APTFamily", "pattern": [{"TEXT": {"REGEX": "APT[A-Za-z0-9-]+"}}]},
        {"label": "APTFamily", "pattern": [{"TEXT": {"REGEX": "(T|t)eam"}}]},
        {"label": "APTFamily", "pattern": [{"TEXT": {"REGEX": "(A|a)ctor[s]*"}}]},

        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "payload[s]*"}}]},
        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "script[s]*"}}]},
        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "(C|c)ommand[s]*"}}]},
        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "malware"}}]},
        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "stager"}}]},

        {"label": "DocumentFile", "pattern": [{"TEXT": {"REGEX": "(D|d)ocument[s]*"}}]},
        {"label": "DocumentFile", "pattern": [{"TEXT": {"REGEX": "(|c)redential[s]*"}}]},
        {"label": "DocumentFile", "pattern": [{"TEXT": {"REGEX": "(A|a)ttachment[s]*"}}]},

        {"label": "NetLoc", "pattern": [{"TEXT": {"REGEX": "(E|e)[-]*mail[s]*"}}]},

        {"label": "Service", "pattern": [{"TEXT": {"REGEX": "(T|t)ask[s]*"}}]},

        {"label": "Vulnerability", "pattern": [{"TEXT": {"REGEX": "(E|e)xploit"}}]}
    ]

    config = {
        "phrase_matcher_attr": None,
        "validate": True,
        "overwrite_ents": False,
        "ent_id_sep": "||",
    }

    def ner_with_regex(self):
        ruler = self.nlp.add_pipe("entity_ruler", config=self.config, before="ner")
        ruler.add_patterns(self.patterns)

        # doc = self.nlp("APT3 has used PowerShell on victim systems to download and run payloads after exploitation.")
        # print([(ent.text, ent.label_) for ent in doc.ents])

    def parser(self, text: str, model_location="./new_cti.model"):
        self.nlp = spacy.load(model_location)
        self.ner_with_regex()

        doc = self.nlp(text)
        return doc


# %%

if __name__ == '__main__':
    sample = "APT3 has used PowerShell on victim systems to download and run payloads after exploitation."

    ner_model = NER_With_Spacy("en_core_web_sm")
    # ner_model = NER_With_Spacy()
    labeled_data = ner_model.read_labeled_data(r"C:\Users\xiaowan\Documents\GitHub\AttacKG\NLP\Doccano\admin.jsonl")
    spacy_data = ner_model.convert_data_format(labeled_data)
    ner_model.train_model(spacy_data)

    doc = ner_model.nlp(sample)
    print([(ent.text, ent.label_) for ent in doc.ents])

    ner_model.ner_with_regex()
    doc = ner_model.nlp(sample)
    print([(ent.text, ent.label_) for ent in doc.ents])
    sents = [sent for sent in doc.sents]
    pass
