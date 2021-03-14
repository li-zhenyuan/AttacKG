import pdfplumber
from html2text import html2text
import spacy
import re


# todo: how to handle pdf new lines
def read_pdf(file):
    with pdfplumber.open(file) as plumber:
        for page in plumber.pages:
            text = page.extract_text()
            text = text.replace('\n', '')
            print(text)
            # spacy_stentencizer(text)

def read_html(file):
    with open(file, 'rb') as html_content:
        html = str(html_content.read())
        print(html)
        text = html2text(html)
        print(text)

        return text
        # spacy_stentencizer(text)

def spacy_stentencizer(text: str):
    nlp = spacy.load('en_core_web_sm')
    # boundary = re.compile('^[0-9]$')
    text_sentences = nlp(text)
    for sentence in text_sentences:
        print(sentence.text)

