## INSTALL SETUP ##
install:
	sudo apt update -y
	sudo apt install -y openjdk-8-jdk git build-essential subversion perl curl unzip cpanminus make python3 python-is-python3
	#DATA ALREADY CACHED, SKIPPING OVER STEP: git clone https://github.com/rjust/defects4j.git lib/defects4j 
	sudo cpanm --installdeps ./lib/defects4j
	lib/defects4j/init.sh
	#DATA ALREADY CACHED, SKIPPING OVER STEP: #lib/defects4j/framework/bin/defects4j checkout -p Cli -v32f -w Cli-32f
	#DATA ALREADY CACHED, SKIPPING OVER STEP: #lib/defects4j/framework/bin/defects4j checkout -p Gson -v15f -w Gson-15f
	#DATA ALREADY CACHED, SKIPPING OVER STEP: #lib/defects4j/framework/bin/defects4j checkout -p Lang -v53f -w Lang-53f
.PHONY: install



## TESTS ##
DATE=${shell date '+%Y-%m-%d %H:%M:%S'}
LOG_FILE=logs/${DATE}.log
RESULT_FILE=results/${DATE}.json
PROCESSED_FILE=results/${DATE}.json

Cli:
	# clean, compile, run judy, and preprocess results
	rm -rf Cli-32f/target/
	lib/defects4j/framework/bin/defects4j compile -w Cli-32f
	java -jar lib/judy-all-3.0.0-M1-all.jar -p Cli-32f/target/classes/ -t Cli-32f/target/test-classes/ --result-path "Cli-32f/${RESULT_FILE}" > "Cli-32f/${LOG_FILE}"
	python lib/filtermutants.py "Cli-32f/$(PROCESSED_FILE)" org.apache.commons.cli.HelpFormatter

Gson:
	# clean, compile, run judy, and preprocess results
	rm -rf Gson-15f/target/
	lib/defects4j/framework/bin/defects4j compile -w Gson-15f
	java -jar lib/judy-all-3.0.0-M1-all.jar -p Gson-15f/target/classes/com/google/gson/stream/ -t Gson-15f/target/test-classes/com/google/gson/stream/ --result-path "Gson-15f/${RESULT_FILE}" > "Gson-15f/${LOG_FILE}"
	python lib/filtermutants.py "Gson-15f/$(PROCESSED_FILE)" com.google.gson.stream.JsonWriter

Lang:
	# clean, compile, run judy, and preprocess results
	rm -rf Lang-53f/target/
	lib/defects4j/framework/bin/defects4j compile -w Lang-53f
	java -jar lib/judy-all-3.0.0-M1-all.jar -p Lang-53f/target/classes/org/apache/commons/lang/time/ -t Lang-53f/target/tests/org/apache/commons/lang/time/ --result-path "Lang-53f/${RESULT_FILE}" > "Lang-53f/${LOG_FILE}"
	python lib/filtermutants.py "Lang-53f/$(PROCESSED_FILE)" org.apache.commons.lang.time.DateUtils

