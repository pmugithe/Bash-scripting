#!/bin/bash

echo "This is a Redis script file"

#Validate root user if not dont execute it
USER_ID=$(id -u)
COMPONENT=redis
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
curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo   &>> ${LOGFILE}
stat $?

echo -n "Installing nodejs..."
yum install redis-6.2.13 -y &>> ${LOGFILE}
stat $?

echo -n "Enabling the ${COMPONENT} visibility..."
sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/redis.conf
stat $?

echo -n "Starting the ${COMPONENT} component..."
systemctl daemon-reload &>> ${LOGFILE}
systemctl enable redis  &>> ${LOGFILE}
systemctl start redis  &>> ${LOGFILE}
stat $?