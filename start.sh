#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
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

echo "Cleaning up..."
rm -rf awscliv2.zip aws

echo "AWS CLI installation completed successfully."






