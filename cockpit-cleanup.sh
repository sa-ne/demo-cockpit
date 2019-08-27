#!/bin/bash

# Clean up packages
echo -e "Cleaning up cockpit packages ..."
yum remove -y setroubleshoot-server
yum remove -y sos
yum remove -y "cockpit*"

# Clean up remainder of changes made for demo
echo -e "Cleaning up ..."
firewall-cmd --remove-service=cockpit
firewall-cmd --reload
# This command will throw an error if cockpit packages were succussfully removed.  Error = ok
systemctl disable cockpit.socket
subscription-manager repos --disable=rhel-7-server-extras-rpms
rm -rf /usr/share/cockpit
rm -rf /etc/cockpit
userdel -rf cockpituser
# If cockpit-selinux.sh was used to create SELinux event, additional cleanup.
yum erase -y httpd httpd-tools
firewall-cmd --remove-service=http --permanent
firewall-cmd --reload
