#!/usr/bin/python

import sys
import json
import csv

results_filename = sys.argv[1]
results = json.load(open(results_filename))
classname = sys.argv[2]
descriptions = {operator['name']: operator['description']
				for operator in results['operators']}

csv_filename = results_filename.replace('.json', '.mutants.csv')
csv_writer = csv.writer(open(csv_filename , 'w'), quoting=csv.QUOTE_ALL)

lines = []
for c in results['classes']:
	if c['name'] == classname:
		for mutant in c['notKilledMutant']:
			line = mutant['lines'][0]
			operator = mutant['operators'][0]
			description = descriptions[operator]
			point = mutant['points'][0]
			# if line > 0:
			lines.append([line, operator, description, point])
		break

print('{} mutants found!'.format(len(lines)))

if len(lines) > 1:
	lines.sort(key=lambda line: line[0])
	csv_writer.writerow(['Line','Operator','Description','Point'])
	for line in lines:
		csv_writer.writerow(line)

		
	
