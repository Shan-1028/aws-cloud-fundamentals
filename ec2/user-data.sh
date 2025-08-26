#!/bin/bash
# Update packages
sudo yum update -y

# Install Nginx
sudo amazon-linux-extras enable nginx1
sudo yum install -y nginx

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Replace default Nginx page with our index.html
echo "<h1>Hello from my EC2 Hands-on Project 🚀</h1>" | sudo tee /usr/share/nginx/html/index.html
