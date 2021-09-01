from keybert import KeyBERT
import re

# %%

example_file = "produce_examples_picked.txt"
output_file = "produce_examples_picked_single_keywords.txt"

keyword_list = []

with open(example_file, 'r') as example_input, open(output_file, 'w+') as output:
    example_list = example_input.readlines()

    kw_model = KeyBERT()
    for example in example_list:
        example = re.sub("\[[0-9]+\]+", "", example)
        keywords = kw_model.extract_keywords(example, keyphrase_ngram_range=(1,1))
        print(keywords)
        keyword_list += keywords
        output.write(str(keywords) + "\n")


# %%

keywords_count_dict = {}

for keyword in keyword_list:
    keyword_string = keyword[0]

    if keyword_string not in keywords_count_dict.keys():
        keywords_count_dict[keyword_string] = 1
    else:
        keywords_count_dict[keyword_string] += 1
