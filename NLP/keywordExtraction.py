from keybert import KeyBERT
import re

# %%

if __name__ == '__main__':
    example_file = "produce_examples_picked.txt"
    output_file = "produce_examples_picked_single_keywords.txt"

    with open(example_file, 'r') as example_input, open(output_file, 'w+') as output:
        example_list = example_input.readlines()

        kw_model = KeyBERT()
        for example in example_list:
            example = re.sub("\[[0-9]+\]+", "", example)
            keywords = kw_model.extract_keywords(example, keyphrase_ngram_range=(1,1))
            print(keywords)
            output.write(str(keywords) + "\n")
