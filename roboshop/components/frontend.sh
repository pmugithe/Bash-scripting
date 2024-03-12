#!/bin/bash

echo "This is a Frontend script file"

#Validate root user if not dont execute it
USER_ID=$(id -u)
COMPONENT=$1
LOGFILE= "/tmp/${COMPONENT}.log"

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[31m Please login with valid user or sudo user\e[0m \n \t Example: sudo bash wrapper.sh frontendh.sh"
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

echo -n "Configuring ${COMPONENT}: "
yum install nginx -y &>> ${LOGFILE}

stat $?

echo -n "Starting nginx..."
systemctl enable nginx &>> ${LOGFILE}
systemctl start nginx  &>> ${LOGFILE}
stat $?
echo -n "Downloading the ${COMPONENT} component..."

curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

stat $?

echo -n "Clearing the old ${COMPONENT}..."
cd /usr/share/nginx/html 
rm -rf * &>> ${LOGFILE}
stat $?
echo -n "Extracting and sorting the $1 folder..."
unzip /tmp/frontend.zip &>> ${LOGFILE}
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf 
stat $?

echo -n "Restarting ${COMPONENT} server..."

systemctl daemon-reload 
systemctl restart nginx &>> ${LOGFILE}

stat $?






# Script should if the user is not a root user rather executing the commands and failing
# How can we handle this? Validation!!!!

# yum install nginx -y
# systemctl enable nginx
# systemctl start nginx

# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf

