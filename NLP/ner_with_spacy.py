import spacy
from spacy.training import Example
import random
import json

def read_data_jsonl():
    labeled_data = []
    with open(r"/home/zhenyuan/AttacKG/NLP/Doccano/admin.jsonl", "r") as read_file:
        for line in read_file:
            data = json.loads(line)
            labeled_data.append(data)

    print('---Read Labeled Data(%d)!---' % len(labeled_data))
    return labeled_data


class spacy_ner:

    nlp = spacy.blank("en")
    spacy_data = []
    model_location = "/home/zhenyuan/AttacKG/NLP/cti.model"

    def convert_jsonl_spacy(self, labeled_data):
        for entry in labeled_data:
            entities = []
            for e in entry['label']:
                entities.append((e[0], e[1], e[2]))
            self.spacy_data.append(Example.from_dict(self.nlp.make_doc(entry['data']), {"entities": entities}))

        self.nlp.initialize(lambda: self.spacy_data)
    # split training and testing set
    # training_set = spacy_data[0:19]
    # testing_set = spacy_data[20:-1]

    def spacy_training(self):
        # Start training
        print("---Start Training!---")

        ner = self.nlp.add_pipe("ner")
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

        self.nlp.begin_training()

        # Loop
        for itn in range(4):
            random.shuffle(self.spacy_data)
            # losses = ()

            # Batch the examples
            for batch in spacy.util.minibatch(self.spacy_data, size=2):
                # Update the model
                self.nlp.update(batch)
                # print(losses)

        self.nlp.to_disk(self.model_location)
        print("---Save Model to %s!---" % self.model_location)


if __name__ == '__main__':
    sn = spacy_ner()
    sn.convert_jsonl_spacy(read_data_jsonl())
    sn.spacy_training()
