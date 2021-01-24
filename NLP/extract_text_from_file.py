import pdfplumber

def read_pdf(file):
    with pdfplumber.open(file) as plumber:
        for page in plumber.pages:
            text = page.extract_text()
            print(text)


if __name__ == '__main__':
    read_pdf("/mnt/c/Users/wan/Documents/AttacKG/data/cti/Cybereason Labs Analysis Operation Cobalt Kitty.pdf")