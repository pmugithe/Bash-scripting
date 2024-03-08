#!/bin/bash  
  
<<COMMENT
# Operations on Numbers
    -eq = equals
    -ne = not equals
    -gt = greater than
    -lt = less than
    -ge = greather than or equals to
    -le = less than or equals to 
# Operations on Strings
    =
    ==
    !=
# Operations on File
    -d FILE	To check if FILE exists and it is a directory.
    -e FILE	To check if FILE exists.
    -r FILE	To check if FILE exists and the read permission is granted.
    -s FILE	To check if FILE exists and its size is greater than zero (which means that it is not empty).
    -w FILE	To check if FILE exists and the write permission is granted.
     x FILE	To check if FILE exists and the execute permission is granted.
COMMENT

echo "Demo on usage of IF Statements"

read -p " Enter number : " number  

#IF STATEMENTS  
if [ $number -gt 125 ]  
then  
echo "Value is greater than 125"  
fi  

#IF ELSE STATEMENTS

# if [ condition ];  
# then  
#    <if block commands>  
# else  
#   <else block commands>  
# fi  

read -p "Enter your input" INPUT
if [ $INPUT -gt 3 ];  
then  
  echo "Given Input is greater than 3."  
else  
  echo "Given Input is not greater than 3."  
fi  
