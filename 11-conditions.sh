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
esac

