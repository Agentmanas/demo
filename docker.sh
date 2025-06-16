#!/bin/bash

set -e  # Exit on any error

echo "Updating package information..."
sudo apt update -y
sudo apt install -y curl

echo "Downloading and running Docker's convenience installation script..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh


echo "Cleaning up..."
rm get-docker.sh

echo "Docker installation completed!"

# Verify installation
docker --version
