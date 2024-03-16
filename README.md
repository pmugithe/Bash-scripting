# Bash-scripting
## Notes and resources for learning shell scripting

Date: 3/5/2024
```
    1. Bash Scripting for automation and its very good at performance because of Bash being native to linux and it don't need any additional software.

    2. This repo also serves as manual to automate the Infrastructure Provisioning and Configuration Management.
```
# Table of Contents:
```
1. Introduction
2. SheBang notation and comments
3. Printing
4. Variables
    4.1. Local Variables
    4.2. Environment Variables
    4.3. Command Substitution
5. Inputs
    5.1. Special Variables
    5.2. Prompts
6. Functions
7. Redirectors, Quotes and Exit Status
8. Conditions
9. Loops
10. Sed Commands
11. Command
``` 

# In Bash scripting, even if the instruction x fails, it goes with next commands in sequence.

### If you want to override this, you can use "set -e" in the beginning of the script.

## How to keep our code DRY?
    1. We can define functions and call them whenever needed
    2. we define function in common.sh and call all the function from common file
        2a. for Nodejc Components, create a function and declare all action in it and call it whenever you need     nodejs  
        2b. for Python Components, create a function and declare all action in it and call it whenever you need     python
        2c. for Java Components, create a function and declare all action in it and call it whenever you need     java 
        2d. for Angular Components, create a function and declare all action in it and call it whenever you need    angular
    


