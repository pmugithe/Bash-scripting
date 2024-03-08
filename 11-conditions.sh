#!/bin/bash

#Conditions

# Syntax of case

# case $var in
#     opt 1) some commands;;
#     opt 2) some commands;;
# esac

ACTION=$1

case $ACTION in
    start)
        echo "In the starting condition"
        exit 0
        ;;
    stop) 
        echo "In the stop condition"
        exit 1
        ;;
    restart)
        echo "Restart condition" 
        exit 2
        ;;
    *) #if start, stop or rstart were not give, print not a valid, chose start, stop or restart
        echo "Invalid Options"
        echo "Choose start, stop or restart" 
        exit 3
        ;;
esac


echo "Do you know Java Programming?"  
read -p "Yes/No? :" Answer  
case $Answer in  
    Yes|yes|y|Y)  
        echo "That's amazing."  
        echo  
        ;;  
    No|no|N|n)  
        echo "It's easy. Let's start learning from javatpoint."  
        ;;  
esac  
