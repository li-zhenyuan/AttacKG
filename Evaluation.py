#%%

import numpy
import csv

# example_identification_result = numpy.genfromtxt('technique_matching_result.csv', delimiter=',')
with open('technique_matching_result.csv') as csvfile:
    spamreader = csv.reader(csvfile)
    data = list(spamreader)

#%%

current_technique_name = ""
current_technique_stat = None
current_technique_count = 0
for row in data[1:]:
    if row[0][13:18] == current_technique_name:
        current_technique_count += 1
        current_technique_stat += numpy.array(row[1:])
    else:
        current_technique_name = row[0][13:18]
        current_technique_count = 1
        current_technique_stat = numpy.array(row[1:])


#%%
data[1][0][13:18]