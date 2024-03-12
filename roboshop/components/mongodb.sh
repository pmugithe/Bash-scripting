#!/bin/bash

echo "This is a MongoDB script file"

#Validate root user if not dont execute it
USER_ID=$(id -u)
COMPONENT=mongodb
LOGFILE="/tmp/${COMPONENT}.log"

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

echo  "Configuring ${COMPONENT}... "

echo -n "Setting up ${COMPONENT} repos..."
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $?


echo -n "Installing ${COMPONENT}..."
yum install -y mongodb-org &>> ${LOGFILE}
stat $?

echo "Enabling the ${COMPONENT} visibility..."
sed -ie 's/127.0.0.1/0.0.0.0/g' /ect/mongod.conf
stat $?

echo -n "Starting the ${COMPONENT} component..."
systemctl enable mongod &>> ${LOGFILE}
systemctl start mongod &>> ${LOGFILE}
stat $?



# echo -n "Downloading the ${COMPONENT} component..."

# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

# stat $?

# echo -n "Clearing the old ${COMPONENT}..."
# cd /usr/share/nginx/html 
# rm -rf * &>> ${LOGFILE}
# stat $?
# echo -n "Extracting and sorting the ${COMPONENT} folder..."
# unzip /tmp/frontend.zip &>> ${LOGFILE}
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf 
# stat $?

# echo -n "Restarting ${COMPONENT} server..."

# systemctl daemon-reload 
# systemctl restart nginx &>> ${LOGFILE}

# stat $?