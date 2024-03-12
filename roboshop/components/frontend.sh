#!/bin/bash

echo "This is a Frontend script file"

#Validate root user if not dont execute it
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[31m Please login with valid user or sudo user\e[0m \n \t Example: sudo bash wrapper.sh frontendh.sh"
    exit 1
fi
echo "Frontend Configuring"
yum install nginx -y &>> /tmp/frontend.log


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

