#%%

import numpy
import csv

# example_identification_result = numpy.genfromtxt('technique_matching_result.csv', delimiter=',')
import numpy as np

with open(r'results/all_technique_matching_result_0818.csv') as csvfile:
    spamreader = csv.reader(csvfile)
    data = list(spamreader)

#%%

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
    if row[0][13:18] == current_technique_name:
        current_technique_count += 1
        current_technique_stat = list_add(current_technique_stat, [float(v) for v in row[1:]])
    else:
        stat.append([stat/current_technique_count for stat in current_technique_stat])
        print(current_technique_name)

        current_technique_name = row[0][13:18]
        current_technique_count = 1
        current_technique_stat = [float(v) for v in row[1:]]


#%%

with open(r'results/all_technique_matching_result_stat_0818.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)

    for s in stat:
        writer.writerow(s)