#!/bin/bash

#!/bin/bash 

COMPONENT=user

# This is how we import the functions that are declared in a different file using source 
source components/common.sh
NODEJS                       # calling nodejs function.

echo -e "\n \e[35m ${COMPONENT} Installation Is Completed \e[0m \n"




# echo "This is a User script file"

# #Validate root user if not dont execute it
# USER_ID=$(id -u)
# COMPONENT=user
# LOGFILE="/tmp/${COMPONENT}.log"

# #Adding an APP User
# APPUSER="roboshop"

# if [ $USER_ID -ne 0 ]; then
#     echo -e "\e[31m Please login with valid user or sudo user\e[0m \n \t Example: sudo bash wrapper.sh mongodb.sh"
#     exit 1
# fi

# # Function to check the status

# stat() {
#     if [ $1 -eq 0 ]; then 
#         echo -e "\e[32m Success \e[0m"
#     else
#         echo -e "\e[32m Failure \e[0m"
#     fi

# }

# echo -n "Configuring ${COMPONENT}... "
# curl --silent --location https://rpm.nodesource.com/setup_16.x | bash - &>> ${LOGFILE}
# stat $?

# echo -n "Installing nodejs..."
# yum install nodejs -y  &>> ${LOGFILE}
# stat $?

# id ${APPUSER}
# if [ $? -ne 0 ]; then 
#     echo -n "Creating an Application user..."
#     useradd roboshop
#     stat $?
# fi

# echo -n "Downloading the ${COMPONENT}..."
# curl -s -L -o /tmp/user.zip "https://github.com/stans-robot-project/user/archive/main.zip"
# stat $?

# # we can't change terminal in a automation scripting, 

# echo -n "Changing the ${COMPONENT} to ${APPUSER} home directory..."
# cd /home/${APPUSER}/
# rm -rf ${COMPONENT} &>> ${LOGFILE}
# unzip -o /tmp/catalogue.zip &>> ${LOGFILE}
# stat $?

# echo -n "Changing the ownership to ${APPUSER}..."
# mv user-main catalogue 
# chown -R ${APPUSER}:${APPUSER} /home/${APPUSER}/${COMPONENT}/
# stat $?

# echo -n "Generating ${COMPONENT} Artifacts..."
# cd /home/${APPUSER}/${COMPONENT}/
# npm install &>> ${LOGFILE}
# stat $?


# echo -n "Updating the ${COMPONENT} systemd file"
# sed -ie 's/REDIS_ENDPOINT/172.31.82.178/' /home/${APPUSER}/${COMPONENT}/systemd.service
# sed -ie 's/MONGO_ENDPOINT/172.31.18.176/' /home/${APPUSER}/${COMPONENT}/systemd.service

# mv /home/${APPUSER}/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
# stat $?

# echo -n "Starting the service..."
# systemctl daemon-reload  &>> ${LOGFILE}
# systemctl enable catalogue   &>> ${LOGFILE}
# systemctl start catalogue  &>> ${LOGFILE}
# systemctl restart catalogue   &>> ${LOGFILE}
# systemctl status catalogue -l  &>> ${LOGFILE}

