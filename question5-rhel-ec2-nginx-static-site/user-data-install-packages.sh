#!/bin/bash

# Update and install required packages
yum install -y aws-cli 
yum install -y nginx
yum install -y wget

# Configure Nginx to host a static website
echo "Hello from EC2 instance $(hostname)" > /usr/share/nginx/html/index.html
systemctl enable nginx
systemctl start nginx