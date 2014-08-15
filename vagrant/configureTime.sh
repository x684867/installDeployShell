#!/bin/bash
#
# configureTime.sh
# (c) 2014 Sam Caldwell.  Public Domain
#
sudo $APT_OPTS apt-get purge ntp -y
sudo $APT_OPTS apt-get install ntpdate -y
sudo su -c 'echo "America/Chicago" > /etc/timezone'
sudo $APT_OPTS dpkg-reconfigure tzdata
