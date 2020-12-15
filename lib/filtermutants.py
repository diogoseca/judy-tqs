#!/usr/bin/python

import sys
import json
import csv

results_filename = sys.argv[1]
results = json.load(open(results_filename))
classname = sys.argv[2]
descriptions = {operator['name']: operator['description']
				for operator in results['operators']}

mutants_filename = results_filename.replace('.json', '.mutants.csv')
mutants_writer = csv.writer(open(mutants_filename , 'w'), quoting=csv.QUOTE_ALL)
mutants_writer.writerow(['Line','Operator','Description','Point'])

for c in results['classes']:
	if c['name'] != classname:
		continue
	for mutant in c['notKilledMutant']:
		line = mutant['lines'][0]
		operator = mutant['operators'][0]
		description = descriptions[operator]
		point = mutant['points'][0]
		if line > 0:
			mutants_writer.writerow([line, operator, description, point])
	exit()

print('No mutants found!')
		
	
