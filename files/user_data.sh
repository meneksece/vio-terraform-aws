#!/bin/bash
exec > /var/log/user-data.log 2>&1
echo "Starting user-data script..."

sleep 2m 30s

echo "Now after sleeping , Starting user-data script..."


yum update -y
yum install epel-release -y

yum install wget unzip httpd -y
systemctl enable httpd
systemctl start httpd

wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip
unzip -o 2117_infinite_loop.zip
cp -r 2117_infinite_loop/* /var/www/html
systemctl restart httpd