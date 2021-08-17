#%%

import numpy
import csv

# example_identification_result = numpy.genfromtxt('technique_matching_result.csv', delimiter=',')
import numpy as np

with open(r'results/technique_matching_result_0814.csv') as csvfile:
    spamreader = csv.reader(csvfile)
    data = list(spamreader)

#%%

def list_add(a,b):
    c = []
    for i in range(len(a)):
        c.append(a[i]+b[i])
    return c

stat = []

current_technique_name = ""
current_technique_stat = []
current_technique_count = 0
for row in data[1:]:
    if row[0][13:18] == current_technique_name:
        current_technique_count += 1
        current_technique_stat = list_add(curr numpy.array(row[1:])
    else:
        stat.append([stat/current_technique_count for stat in current_technique_stat])

        current_technique_name = row[0][13:18]
        current_technique_count = 1
        current_technique_stat = numpy.array(row[1:])


#%%
data[1][0][13:18]