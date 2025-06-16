#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating packages..."
sudo apt update -y
sudo apt install -y unzip curl

echo "Downloading AWS CLI v2 installer..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

echo "Unzipping installer..."
unzip awscliv2.zip

echo "Installing AWS CLI..."
sudo ./aws/install

echo "Verifying AWS CLI installation..."
aws --version

# Prompt user for AWS credentials
read -p "Enter your AWS Access Key ID: " AWS_ACCESS_KEY_ID
read -s -p "Enter your AWS Secret Access Key: " AWS_SECRET_ACCESS_KEY
echo
read -p "Enter your AWS default region (e.g. us-east-1): " AWS_DEFAULT_REGION

# Configure AWS CLI
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set default.region "$AWS_DEFAULT_REGION"
aws configure set output json

# Cleanup
echo "Cleaning up..."
rm -rf awscliv2.zip aws

echo "AWS CLI installed and configured successfully."
