#!/bin/bash
yum install -y java-1.8.0-openjdk
# Add Jenkins repo and import GPG key
curl --silent --location https://pkg.jenkins.io/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Install Jenkins
yum install -y jenkins

# Start and enable Jenkins service
systemctl start jenkins
systemctl enable jenkins

# Open port 8080 for Jenkins
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload