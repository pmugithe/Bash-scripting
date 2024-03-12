#!/bin/bash

echo "This is a Catalouge script file"

#Validate root user if not dont execute it
USER_ID=$(id -u)
COMPONENT=catalogue
LOGFILE="/tmp/${COMPONENT}.log"

#Adding an APP User
APPUSER="roboshop"

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[31m Please login with valid user or sudo user\e[0m \n \t Example: sudo bash wrapper.sh mongodb.sh"
    exit 1
fi

# Function to check the status

stat() {
    if [ $1 -eq 0 ]; then 
        echo -e "\e[32m Success \e[0m"
    else
        echo -e "\e[32m Failure \e[0m"
    fi

}

echo -n "Configuring ${COMPONENT}... "

yum install https://rpm.nodesource.com/pub_16.x/nodistro/repo/nodesource-release-nodistro-1.noarch.rpm -y &>> ${LOGFILE}
stat $?

echo -n "Installing nodejs..."
yum install nodejs -y  &>> ${LOGFILE}
stat $?

id ${APPUSER}
if [ $? -ne 0 ]; then 
    echo -n "Creating an Application user..."
    useradd roboshop
    stat $?
fi



# echo -n "Installing ${COMPONENT}..."
# yum install -y mongodb-org &>> ${LOGFILE}
# stat $?

# echo -n "Enabling the ${COMPONENT} visibility..."
# sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
# stat $?

# echo -n "Starting the ${COMPONENT} component..."
# systemctl enable mongod  &>> ${LOGFILE}
# systemctl start mongod  &>> ${LOGFILE}
# stat $?

# echo -n "Restarting the ${COMPONENT}..."
# systemctl restart mongod &>> ${LOGFILE}
# stat $?

# echo -n "Downloading the ${COMPONENT} components..."
# curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
# stat $?
# echo -n "Organizing the ${COMPONENT} schema..."
# cd /tmp
# unzip mongodb.zip
# cd mongodb-main
# mongo < catalogue.js &>> ${LOGFILE}
# mongo < users.js    &>> ${LOGFILE}
# stat $?

