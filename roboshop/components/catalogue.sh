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

echo -n "Downloading the ${COMPONENT}..."
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"
stat $?

# we can't change terminal in a automation scripting, 

echo -n "Changing the ${COMPONENT} to ${APPUSER} home directory..."
cd /home/${APPUSER}/
rm -rf ${COMPONENT} &>> ${LOGFILE}
unzip -o /tmp/catalogue.zip &>> ${LOGFILE}
stat $?

echo -n "Changing the ownership to ${APPUSER}..."
mv catalogue-main catalogue 
chown -R ${APPUSER}:${APPUSER} /home/${APPUSER}/${COMPONENT}/
stat $?

echo -n "Generating ${COMPONENT} Artifacts..."
cd /home/${APPUSER}/${COMPONENT}/
npm install &>> ${LOGFILE}
stat $?


echo -n "Updating the systemd file"
sed -ie 's/MONGO_DNSNAME/ip-172-31-18-176.ec2.internal/' /home/${APPUSER}/${COMPONENT}/systemd.service
mv /home/${APPUSER}/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
stat $?

