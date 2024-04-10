#/bin/bash

# To create a server, we need
# 1. AMI ID
# 2. Type of Instance
# 3. Security Group
# 4. Instances you need
# 5. DNS Record : Hosted Zone ID

AMI_ID="ami-0f75a13ad2e340a58"
INSTANCE_TYPE="t2.micro"
SG_ID="sg-00a045fbba0993e06"
COMPONENT=$1

aws ec2 run-instances --image-id $(AMI_ID) --count 1 --instance-type $(INSTANCE_TYPE) --security-group-ids $(SG_ID) --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value={COMPONENT}}]'


