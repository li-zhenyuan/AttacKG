# %%

import pdfplumber
from html2text import html2text
import spacy
import re
import sys

# sys.path.append("..")
# from Attack_KG import AttacKG

# %%

# todo: how to handle pdf new lines
def read_pdf(file):
    with pdfplumber.open(file) as plumber:
        for page in plumber.pages:
            text = page.extract_text()
            text = text.replace('\n', '')
            print(text)
            # spacy_stentencizer(text)


# %%

def read_html(file) -> str:
    with open(file, 'rb') as html_content:
        html = str(html_content.read())
        print(html)
        text = html2text(html)
        print(text)

        return text
        # spacy_stentencizer(text)


# %%

def spacy_stentencizer(text: str, model: str = 'en_core_web_sm') -> list:
    nlp = spacy.load(model)
    # boundary = re.compile('^[0-9]$')

    sentences = []
    doc = nlp(text)
    for sentence in doc.sents:
        sentences.append(sentence)
        print(sentence.text)
        print("--------------------------------")

    return sentences


# %%

ner_labels = ["NetLoc", "APTFamily", "ExeFile", "ScriptsFile", "DocumentFile", "E-mail", "Registry", "File", "Vulnerability", "C2C", "SensInfo", "Service"]

def list_entity(sentence):
    entity_list = []

    for entity in sentence.ents:
        if entity.label_ in ner_labels:
            entity_list.append((entity.text, entity.label_))

    if entity_list:
        print(sentence.text)
        print(entity_list)
        print("=============================")

# %%

if __name__ == '__main__':
    file = r"C:\Users\xiaowan\Documents\GitHub\AttacKG\data\cti\html\0a84e7a880901bd265439bd57da61c5d.html"
    text = read_html(file)

    sentences = spacy_stentencizer(text, "./new_cti.model")

# %%

    for sentence in sentences:
        list_entity(sentence)