#!/bin/bash

echo "This is a Frontend script file"

#Validate root user if not dont execute it
USER_ID=$(id -u)

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

echo -n "Configuring Frontend: "
yum install nginx -y &>> /tmp/frontend.log

stat $?

echo -n "Starting nginx..."
systemctl enable nginx &>> /tmp/frontend.log
systemctl start nginx  &>> /tmp/frontend.log
stat $?
echo -n "Downloading the frontend component..."

curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

stat $?

echo -n "Clearing the old frontend..."
cd /usr/share/nginx/html 
rm -rf * &>> /tmp/frontend.log
stat $?
echo -n "Extracting and sorting the frontend folder..."
unzip /tmp/frontend.zip &>> /tmp/frontend.log
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf 
stat $?

echo -n "Restarting frontend server..."

systemctl daemon-reload 
systemctl restart nginx &>> /tmp/frontend.log

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

