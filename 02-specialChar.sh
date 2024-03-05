#!/bin/bash

echo This file is about special characters particularly escape sequences 

#\n new line
# use -e to enable the escape sequence char features in double quotes with out this, you dont see expected output
#\t tab space

echo -e "Line1\nLine2" 

echo -e "Cloud\tDevops"