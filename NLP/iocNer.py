# References:
# https://towardsdatascience.com/custom-named-entity-recognition-using-spacy-7140ebbb3718
# https://spacy.io/usage/training#api

import spacy
from spacy import displacy
from spacy.training import Example
# import neuralcoref
import random
import json
import logging


ner_labels = [
    "NetLoc",
    "APTFamily",
    "ExeFile",
    "ScriptsFile",
    "DocumentFile",
    "E-mail",
    "Registry",
    "File",
    "Vulnerability",
    "C2C",
    "SensInfo",
    "Service"]


# ner_labels = ["FilePath", "NetLoc", "FileName", "Vulnerability", "Registry", "Attacker", "ExeFile", "DocFIle","Service"]


def read_labeled_data(path: str) -> list:
    labeled_data_path = path
    labeled_data = []
    with open(labeled_data_path, "r") as read_file:
        for line in read_file:
            data = json.loads(line)
            labeled_data.append(data)

    logging.info('---Read Labeled Data(%d)!---' % len(labeled_data))
    return labeled_data


class IoCNer:
    model_location = None

    nlp = None
    optimizer = None

    def __init__(self, model_location=None):
        self.model_location = model_location

        if self.model_location is None:
            self.nlp = spacy.blank('en')
            logging.info("---Created Blank 'en' Model!---")
        else:
            self.nlp = spacy.load(self.model_location)
            logging.info("---Load Model: %s!---" % self.model_location)

        # self.nlp.max_length = 3000000
        self.create_optimizer()

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
                logging.warning("Wrong format: %s!" % entry['data'])
        return spacy_data

    def create_optimizer(self):
        if 'ner' not in self.nlp.pipe_names:
            ner = self.nlp.add_pipe("ner")
        else:
            ner = self.nlp.get_pipe("ner")
        logging.info("---Add Pipe 'ner'!---")

        for label in ner_labels:
            ner.add_label(label)

        if self.model_location is None:
            self.optimizer = self.nlp.begin_training()
        else:
            self.optimizer = ner.create_optimizer()
        logging.info("---Created Optimizer!---")

    def train_model(self, spacy_data: list, new_model_location="./new_cti.model"):
        logging.info("---Start Training!---")
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
        logging.info("---Save Model to %s!---" % new_model_location)

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

        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "(P|p)ayload[s]*"}}]},
        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "(S|s)cript[s]*"}}]},
        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "(C|c)ommand[s]*"}}]},
        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "(M|m)alware"}}]},
        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "(S|s)tager"}}]},
        {"label": "ExeFile", "pattern": [{"TEXT": {"REGEX": "(E|e)xecutable"}}]},

        {"label": "DocumentFile", "pattern": [{"TEXT": {"REGEX": "(D|d)ocument[s]*"}}]},
        {"label": "DocumentFile", "pattern": [{"TEXT": {"REGEX": "(C|c)redential[s]*"}}]},
        {"label": "DocumentFile", "pattern": [{"TEXT": {"REGEX": "(A|a)ttachment[s]*"}}]},

        {"label": "File", "pattern": [{"TEXT": {"REGEX": "(F|f)ile[s]*"}}]},
        {"label": "File", "pattern": [{"TEXT": {"REGEX": "(P|p)ath"}}]},

        {"label": "NetLoc", "pattern": [{"TEXT": {"REGEX": "(E|e)[-]*mail[s]*"}}]},
        {"label": "NetLoc", "pattern": [{"TEXT": {"REGEX": "(N|n)etwork"}}]},

        {"label": "Service", "pattern": [{"TEXT": {"REGEX": "(T|t)ask[s]*"}}]},

        {"label": "Vulnerability", "pattern": [{"TEXT": {"REGEX": "(E|e)xploit"}}]},

        {"label": "Registry", "pattern": [{"TEXT": {"REGEX": "(R|r)egistry"}}]}
    ]

    config = {
        "phrase_matcher_attr": None,
        "validate": True,
        "overwrite_ents": False,
        "ent_id_sep": "||",
    }

    def ner_with_regex(self):
        logging.info("---Add Regex-based NER Pipe!---")

        ruler = self.nlp.add_pipe("entity_ruler", config=self.config, before="ner")
        ruler.add_patterns(self.patterns)

        # doc = self.nlp("APT3 has used PowerShell on victim systems to download and run payloads after exploitation.")
        # print([(ent.text, ent.label_) for ent in doc.ents])

    def parser(self, text: str, model_location="./new_cti.model"):
        logging.info("---S1-1: Parse clean text to NLP doc!---")
        self.nlp = spacy.load(model_location)
        self.ner_with_regex()

        nlp_doc = self.nlp(text)
        return nlp_doc


# %%

if __name__ == '__main__':

    # %%
    # model training flow

    ner_model = IoCNer("en_core_web_sm")
    labeled_data = read_labeled_data(r".\NLP\Doccano\admin.jsonl")
    spacy_data = ner_model.convert_data_format(labeled_data)
    ner_model.train_model(spacy_data)

    # %%
    # model testing flow

    sample = "APT3 has used PowerShell on victim systems to download and run payloads after exploitation."

    doc = ner_model.nlp(sample)
    print([(ent.text, ent.label_) for ent in doc.ents])

    ner_model.ner_with_regex()
    doc = ner_model.nlp(sample)
    print([(ent.text, ent.label_) for ent in doc.ents])
