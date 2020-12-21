# JUDY++ PROJECT
This project is an experiment with [Judy 3.0](http://mutationtesting.org/) on three java projects: Cli (org.apache.commons.cli), Gson (com.google.gson) and Lang (org.apache.commons.lang).


Our goal is to apply mutation testing to the suite of tests of these projects, and to develop additional test classes that help improve mutation test coverage.

In particular, we implement the following test classes:

* Cli-32f/src/test/java/org/apache/commons/cli/StudentTest.java
* Gson-15f/gson/src/test/java/com/google/gson/stream/StudentTest.java
* Lang-53f/src/test/org/apache/commons/lang/time/StudentTest.java

Which focus on improving mutation test coverage of the classes:

* Cli-32f/src/main/java/org/apache/commons/cli/HelpFormatter.java
* Gson-15f/gson/src/main/java/com/google/gson/stream/JsonWriter.java
* Lang-53f/src/java/org/apache/commons/lang/time/DateUtils.java

## How to install

After cloning this repository, open your terminal and type the following on the project root:

``make install``

## How to compile and test

Open your terminal and type:

* ```make Cli```  to test project Cli (org.apache.commons.cli, version 32f)
* ```make Gson``` to test project Gson (com.google.gson, version 15f)
* ```make Lang``` to test project Lang (org.apache.commons.lang, version 53f)

This make step does the following:

1. Compilation using Defects4J;
2. Mutation Testing using Judy 3.0;
3. Processing of Judy's results with Python

## Where can I find the results?

After running one of the make steps above, you will find the results in the following folders:

* Cli-32f/results/
* Gson-15f/results/
* Lang-53f/results/

Judy's raw output is found in .json files. Our data processing produces a clean table in .csv format

## Where can I find the logs for Judy?

* Cli-32f/logs/
* Gson-15f/logs/
* Lang-53f/logs/
