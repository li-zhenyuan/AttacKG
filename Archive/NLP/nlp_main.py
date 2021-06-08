from extract_text_from_file import *

if __name__ == '__main__':
    html_file = r"C:\Users\xiaowan\OneDrive - zju.edu.cn\Pycharm\AttacKG\data\cti\Fake or Fake_ Keeping up with OceanLotus decoys _ WeLiveSecurity.html"
    txt_file = r"C:\Users\xiaowan\OneDrive - zju.edu.cn\Pycharm\AttacKG\data\cti\Fake or Fake_ Keeping up with OceanLotus decoys.txt"
    # read_html()

    with open(txt_file, 'r', encoding='utf-8') as txt_content:
        text = str(txt_content.read())
        # print(text)

        spacy_stentencizer(text)


