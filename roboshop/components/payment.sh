#!/bin/bash

echo "This is a Payment script file"


COMPONENT=payment

# This is how we import the functions that are declared in a different file using source 
source ./common.sh
PYTHON                       # calling nodejs function.

echo -e "\n \e[35m ${COMPONENT} Installation Is Completed \e[0m \n"