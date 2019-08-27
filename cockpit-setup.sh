#!/bin/bash

TextReset='\033[0m'
TextGreen='\033[32m'
TextBlue='\033[34m'
TextLightGrey='\033[37m'
TextBold='\033[1m'

FormatTextPause="$TextReset $TextLightGrey"  # Pause & continue
FormatTextCommands="$TextReset $TextGreen" # Commands to execute
FormatTextSyntax="$TextReset $TextBlue $TextBold" # Command Syntax & other text

# Place before command line to reset text format
FormatRunCommand="echo -e $TextReset"

echo -e $FormatTextSyntax "
  Installing Cockpit via:
  Note: For RHEL 8, cockpit package is installed by default.

  # yum install cockpit

"
$FormatRunCommand
yum install -y cockpit
useradd cockpituser
# This is obviously a terrible security practice, never do this in real life!
echo "cockpit" | passwd --stdin cockpituser
usermod -a -G wheel cockpituser

echo -e $FormatTextSyntax "
  Enable service and firewall

  # systemctl enable cockpit.socket
  # firewall-cmd --permanent --add-service=cockpit
  # firewall-cmd --reload
  # systemctl start cockpit
"
$FormatRunCommand
systemctl enable cockpit.socket
firewall-cmd --permanent --add-service=cockpit
firewall-cmd --reload
systemctl start cockpit

echo -e $FormatTextSyntax "
  Now access via:

	https://`uname -n`:9090

"
$FormatRunCommand
