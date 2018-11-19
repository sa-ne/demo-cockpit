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
systemctl disable cockpit.socket
subscription-manager repos --disable=rhel-7-server-extras-rpms
rm -rf /usr/share/cockpit
rm -rf /etc/cockpit
userdel -rf cockpituser
