#!/bin/bash
# USE UBUNTU 20.04 - INSTANCE: 2GB RAM + 2VCPU MINIMUM

# Update the package list
sudo apt update -y

# Install Java OpenJDK 17
sudo apt install openjdk-17-jdk -y

# Install Maven
sudo apt install maven -y

# Add Jenkins GPG key and repository
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the package list again after adding Jenkins repo
sudo apt update -y

# Install Jenkins
sudo apt install jenkins -y

# Start Jenkins service
sudo service jenkins start

# Display the initial Jenkins admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
