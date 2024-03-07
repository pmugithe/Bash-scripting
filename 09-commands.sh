#!/bin/bash

# There are four types of commands available

# Binary /bin - Regular commands, /sbin - secure bin only for root users
# Aliases Alias or shortcuts 
# Shell builtin Commands
# Functions 

# # How to declare a function?

# # f(){
#         echo Hello
# #   }

# # to call a function we use f

sampleFunction(){
    echo This is a sample function
    echo assume we did run some commands
    echo now exit 
}

echo calling a function here 
sampleFunction
echo called and exited function in above step


# example function

stat(){
    echo "The number of open sessions are:" $(who | wc -l)
    echo " Todays date is: " $(date +%f)
}

stat