#!/bin/bash
#
# HardenSSH
# (c) 2014 Sam Caldwell.  Public Domain.
# mail@samcaldwell.net
#
logWrite(){
	logger "hardenSSH: $1"
	echo "hardenSSH: $1"
}
logWrite "starting..."

BACKUP_FILE="/etc/ssh/sshd_config.bak.$(date +%s)"

logWrite "Creating ssh_config backup file: $BACKUP_FILE"

sudo cp -v /etc/ssh/sshd_config $BACKUP_FILE

logWrite "Enabling config options..."
sudo sed -i -e 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
sudo sed -i -e 's/#PermitEmptyPasswords/PermitEmptyPasswords/' /etc/ssh/sshd_config
sudo sed -i -e 's/#X11Forwarding/X11Forwarding/' /etc/ssh/sshd_config
sudo sed -i -e 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config
sudo sed -i -e 's/#ChallengeResponseAuthentication/ChallengeResponseAuthentication/' /etc/ssh/sshd_config
sudo sed -i -e 's/#LoginGraceTime/LoginGraceTime/' /etc/ssh/sshd_config
sudo sed -i -e 's/#MaxStartups 10:30:60/MaxStartups 10:30:60/' /etc/ssh/sshd_config

logWrite "Hardening config options..."
sudo sed -i -e 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i -e 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
sudo sed -i -e 's/PermitEmptyPasswords yes/PermitEmptyPasswords no/' /etc/ssh/sshd_config
sudo sed -i -e 's/X11Forwarding yes/X11Forwarding no/' /etc/ssh/sshd_config
sudo sed -i -e '/X11DisplayOffset 10/d' /etc/ssh/sshd_config
sudo sed -i -e 's/#PasswordAuthentication yes/#PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i -e 's/ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config
sudo sed -i -e 's/LoginGraceTime 120/LoginGraceTime 60/' /etc/ssh/sshd_config

logWrite "Restarting Service..."
sudo service ssh restart

logWrite "done."