## INSTALL SETUP ##
install:
	sudo apt update -y
	sudo apt install -y openjdk-8-jdk git build-essential subversion perl curl unzip cpanminus make python3 python-is-python3
	#git clone https://github.com/rjust/defects4j.git lib/defects4j
	sudo cpanm --installdeps ./lib/defects4j
	#lib/defects4j/init.sh
	#lib/defects4j/framework/bin/defects4j checkout -p Cli -v32f -w Cli-32f
	#lib/defects4j/framework/bin/defects4j compile -w Cli-32f
	#lib/defects4j/framework/bin/defects4j checkout -p Gson -v15f -w Gson-15f
	#lib/defects4j/framework/bin/defects4j compile -w Gson-15f
	#lib/defects4j/framework/bin/defects4j checkout -p Lang -v53f -w Lang-53f
	#lib/defects4j/framework/bin/defects4j compile -w Lang-53f
.PHONY: install
	

## TESTS ##
Cli:
	# clean and recompile
	echo 'Cleaning...'
	rm -rf Cli-32f/target/
	echo 'Compiling...'
	lib/defects4j/framework/bin/defects4j compile -w Cli-32f

	# run judy on 
	DATE=`date '+%Y-%m-%d %H:%M:%S'`
	echo 'Judy is making some mutants...'
	java -jar lib/judy-all-3.0.0-M1-all.jar -p Cli-32f/target/classes/ -t Cli-32f/target/test-classes/ --result-path "Cli-32f/results/$DATE.json" > "Cli-32f/logs/$DATE.log"
	echo 'Results and log have been saved.'

	# takes the results .json file and produces a dataframe with productive mutants
	python lib/filtermutants.py "Cli-32f/results/$DATE.json" org.apache.commons.cli.HelpFormatter
	echo 'Mutants have been filtered from results.'

Gson:
	# clean and recompile
	echo 'Cleaning...'
	rm -rf Gson-15f/target/
	echo 'Compiling...'
	lib/defects4j/framework/bin/defects4j compile -w Gson-15f

	# run judy on 
	DATE=`date '+%Y-%m-%d %H:%M:%S'`
	echo 'Judy is making some mutants...'
	java -jar lib/judy-all-3.0.0-M1-all.jar -p Gson-15f/target/classes/ -t Gson-15f/target/test-classes/ --result-path "Gson-15f/results/$DATE.json" > "Gson-15f/logs/$DATE.log"
	echo 'Results and log have been saved.'

	# takes the results .json file and produces a dataframe with productive mutants
	python lib/filtermutants.py "Gson-15f/results/$DATE.json" com.google.gson.stream.JsonWriter
	echo 'Mutants have been filtered from results.'

Lang:
	# clean and recompile
	echo 'Cleaning...'
	rm -rf Lang-53f/target/
	echo 'Compiling...'
	lib/defects4j/framework/bin/defects4j compile -w Lang-53f

	# run judy on 
	DATE=`date '+%Y-%m-%d %H:%M:%S'`
	echo 'Judy is making some mutants...'
	java -jar lib/judy-all-3.0.0-M1-all.jar -p Lang-53f/target-class/ -t Lang-53f/target/tests/ --result-path "Lang-53f/results/$DATE.json" > "Lang-53f/logs/$DATE.log"
	echo 'Results and log have been saved.'

	# takes the results .json file and produces a dataframe with productive mutants
	python lib/filtermutants.py "Lang-53f/results/$DATE.json" org.apache.commons.lang.time.DateUtils
	echo 'Mutants have been filtered from results.'

