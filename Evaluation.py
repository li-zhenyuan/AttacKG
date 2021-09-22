#%%
import random

import numpy
import csv

# %%

# example_identification_result = numpy.genfromtxt('technique_matching_result.csv', delimiter=',')
import numpy as np

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
