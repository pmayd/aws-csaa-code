#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
aws s3 cp s3://my-website-assets-2313243d/index.html ./
cp index.html index.txt
EC2AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone) 
sed "s/AZID/$EC2AZ/" /var/www/html/index.txt > /var/www/html/index.html