# JUDY TQS PROJECT

## How to install
``make install``

## How to compile and test

Open your terminal a type:

* ```make Cli```  to test project Cli (version 32f)
* ```make Gson``` to test project Gson (version 15f)
* ```make Lang``` to test project Lang (version 53f)

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

## Where can I find the logs?

* Cli-32f/logs/
* Gson-15f/logs/
* Lang-53f/logs/
