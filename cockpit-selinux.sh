#!/bin/bash

echo -e "Installing required packages ..."
yum install -y httpd httpd-tools

echo -e "Create /var/www/html/index.html"
mkdir -p /var/www/html
echo "SELinux Demo" > /var/www/html/index.html

echo -e "Purposely break web page using booleans"
chcon -R -t home_dir_t /var/www/html/index.html

echo -e "Purposely break the file label"
chcon -R -t shadow_t /var/www/html/index.html

echo -e "Start apache and add firewall rule"
systemctl enable httpd
systemctl start httpd
firewall-cmd --add-service=http --permanent
firewall-cmd --reload
