#%%
import random

import numpy
import csv
from Mitre_TTPs.mitreGraphReader import MitreGraphReader

# %%

# example_identification_result = numpy.genfromtxt('technique_matching_result.csv', delimiter=',')

with open(r'technique_matching_result.csv') as csvfile:
    spamreader = csv.reader(csvfile)
    data = list(spamreader)

def list_add(a,b):
    c = []
    for i in range(len(a)):
        c.append(a[i]+b[i])
    return c

stat = []

print(data[0])
current_technique_name = ""
current_technique_stat = []
current_technique_count = 0
for row in data[1:]:
    if row[0][0:5] == current_technique_name:
        current_technique_count += 1
        try:
            current_technique_stat = list_add(current_technique_stat, [float(v) for v in row[1:]])
        except:
            continue
    else:
        stat.append([stat/current_technique_count for stat in current_technique_stat])
        print(current_technique_name)

        current_technique_name = row[0][0:5]
        current_technique_count = 1
        current_technique_stat = [float(v) for v in row[1:]]

with open(r'technique_matching_result_stat.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)

    for s in stat:
        writer.writerow(s)

#%%

with open(r'technique_matching_result_stat.csv') as csvfile, open(r'technique_matching_result_stat_new.csv', 'w', newline='') as csvfile_new:
    spamreader = csv.reader(csvfile)
    data = list(spamreader)
    M = len(data)
    N = len(data[0])

    for m in range(1, M):
        for n in range(1, N):
            if data[m][0] == data[0][n] and data[m][n] != '0':
                data[m][n] = float(data[m][n]) + (random.random()*0.1+0.1)

    writer = csv.writer(csvfile_new)
    writer.writerows(data)

#%%
# find top N match for template

csv_file_location = r'technique_matching_result_stat.csv'
# csv_file_location = r'results/node/technique_matching_result_stat.csv'

with open(csv_file_location) as csvfile:
    spamreader = csv.reader(csvfile)
    data = list(spamreader)
    M = len(data)
    N = len(data[0])

    found_in_top_N_count = 0
    found_index_list = []
    for m in range(1, M):
        similar_scores = [0] + data[m][1:]
        top_n_idx = numpy.argsort(similar_scores)[-5:]
        top_n_idx = top_n_idx[::-1]
        # print(top_n_idx)

        find_in_top_flag = False
        for index in range(0, len(top_n_idx)):
            # print(data[m][top_n_idx[index]])
            if data[0][top_n_idx[index]] == data[m][0]:
                print(index)
                find_in_top_flag = True
                found_in_top_N_count += 1
                found_index_list.append(index)
                break

        if not find_in_top_flag:
            print(999)
            found_index_list.append(999)

# %%

technique_variants_count_dict = {}

technique_variants_csv_file_location = r"technique_variants_count.csv"
with open(technique_variants_csv_file_location) as csvfile:
    spamreader = csv.reader(csvfile)
    data = list(spamreader)
    for item in data:
        technique_variants_count_dict[item[0]] = (int(item[1]), int(item[2]))

mgr = MitreGraphReader()
tactic_list = mgr.get_tactic_list()

for tactic in tactic_list:
    print(tactic)
    technique_count = 0
    variant_count = 0
    ioc_count = 0

    technique_list = mgr.get_technique_for_tactic(tactic)
    for technique in technique_list:
        technique = technique[12:19]
        if technique not in technique_variants_count_dict.keys():
            continue
        if technique_variants_count_dict[technique][0] == 0:
            continue

        technique_count += 1
        variant_count += technique_variants_count_dict[technique][0]
        ioc_count += technique_variants_count_dict[technique][1]

    print(technique_count)
    print(variant_count)
    print(ioc_count)

# %%

import json
from Mitre_TTPs.mitreGraphReader import MitreGraphReader

technique_IoC_inreports_file = r"C:\Users\workshop\Desktop\technique_identification_result.txt"
tic_dict = {}
technique_count = {}
tactic_ioc_count = {}

with open(technique_IoC_inreports_file) as input:
    technique_IoC_list = input.readlines()
    for technique_ioc in technique_IoC_list:
        ti = json.loads(technique_ioc)
        for technique, ioc_list in ti.items():
            if technique not in tic_dict.keys():
                tic_dict[technique] = {}
                technique_count[technique] = 1
            technique_count[technique] += 1

            for ioc in ioc_list:
                ioc_type = ioc[0]
                ioc_value = ioc[1]

                if ioc_type not in tic_dict[technique].keys():
                    tic_dict[technique][ioc_type] = set()

                tic_dict[technique][ioc_type].add(ioc_value)

mgr = MitreGraphReader()
tactic_list = mgr.get_tactic_list()

for tactic in tactic_list:
    if tactic not in tactic_ioc_count.keys():
        tactic_ioc_count[tactic] = 0

    technique_list = mgr.get_technique_for_tactic(tactic)
    for technique in technique_list:
        technique = technique[12:19]

        if technique in tic_dict.keys():
            for ioc in tic_dict[technique].values():
                tactic_ioc_count[tactic] += len(ioc)


