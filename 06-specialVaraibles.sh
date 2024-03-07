#!/bin/bash

#Technical aspects of Special variables asked in interviews

# to find out the name of scripts executing
# Like $0 to $9, $?, $#, $*, $@

# $0 prints name of the scripts executing

echo "Scripts exeucting now is: " $0

# $1- $9 are the arguments for a bash script example: bash file.sh arg1, arg2, ... arg9

echo "Today is " $1