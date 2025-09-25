#!/bin/bash

###############################
# Description: Create VPC in AWS
# - Create VPC
# - Create a public subnet
#
# - Verify if user has AWS Installed, User might be using windows, linux or mac.
# - Verify if AWS CLI is configured
###############################

# Variables
VPC_CIDR="10.0.0.0/16"
SUBNET_CIDR="10.0.3.0/24"
REGION="ap-south-1"
VPC_NAME="demo-vpc"
SUBNET_NAME="demo-subnet"
SUBNET_AZ="ap-south-1a"

# Verify if AWS CLI is installed
if ! [ -x "$(command -v aws)" ]; then
  echo "Error: AWS CLI is not installed. Please install it and configure it."
  exit 1
fi

# Verify if AWS CLI is configured
aws sts get-caller-identity &> /dev/null
if [ $? -ne 0 ]; then
  echo "Error: AWS CLI is not configured. Please configure it."
  exit 1
fi

# Create VPC
VPC_ID=$(aws ec2 create-vpc --cidr-block $VPC_CIDR --query 'Vpc.{VpcId:VpcId}' --output text)

# Add Name tag to VPC
aws ec2 create-tags --resources $VPC_ID --tags "Key=Name,Value=$VPC_NAME"

# Create Subnet
SUBNET_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET_CIDR --availability-zone $SUBNET_AZ)
