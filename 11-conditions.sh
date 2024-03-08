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
        ;;
    stop) 
        echo "In the stop condition" ;;
    restart)
        echo "Restart condition" ;;
    *) #if start, stop or rstart were not give, print not a valid, chose start, stop or restart
        echo "Invalid Options"
        echo "Choose start, stop or restart" 
        ;;
esac

