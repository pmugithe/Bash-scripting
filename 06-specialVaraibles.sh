#!/bin/bash

#Technical aspects of Special variables asked in interviews

# to find out the name of scripts executing
# Like $0 to $9, $?, $#, $*, $@

# $0 prints name of the scripts executing

echo "Scripts exeucting now is: " $0

# $1- $9 are the arguments for a bash script example: bash file.sh arg1, arg2, ... arg9

echo "Today is " $1

# $0 specifies the name of the script to be invoked.
# $1-$9 stores the names of the first 9 arguments or can be used as the arguments' positions.
# $# specifies the total number (count) of arguments passed to the script.
# $* stores all the command line arguments by joining them together.
# $@ stores the list of arguments as an array.
# $$ specifies the process ID of the current script.
# $? specifies the exit status of the last command or the most recent execution process.
# $! shows ID of the last background job.