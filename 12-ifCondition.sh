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

COMMENT

echo "Demo on usage of IF Statements"

read -p " Enter number : " number  
  
if [ $number -gt 125 ]  
then  
echo "Value is greater than 125"  
fi  