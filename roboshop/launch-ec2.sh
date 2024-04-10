#/bin/bash

# To create a server, we need
# 1. AMI ID
# 2. Type of Instance
# 3. Security Group
# 4. Instances you need
# 5. DNS Record : Hosted Zone ID

# Creating EC2-Instances
if [ -z $1 ]  ; then 
    echo -e "\e[31m COMPONENT NAME IS NEEDED \e[0m \n \t \t"
    echo -e "\e[35m Example Usage: \e[0m \n\t\t $ bash launch-ec2.sh shipping"
    exit 1
fi 

AMI_ID="ami-0f75a13ad2e340a58"
INSTANCE_TYPE="t2.micro"
# SG_ID="sg-00a045fbba0993e06"


aws ec2 run-instances --image-id ${AMI_ID} --count 1 --instance-type ${INSTANCE_TYPE} --security-group sg-00a045fbba0993e06 "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]"


