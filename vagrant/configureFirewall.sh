#!/bin/bash
#
# hardenUFW
# (c) 2012 Sam Caldwell  Public Domain.
#
# This script is self-explanatory.
#
apt-get $APT_OPTS install ufw -y
ufw status &> /dev/null || apt-get install ufw -y
ufw --force reset
ufw --force enable
ufw logging low
ufw allow in ssh
ufw allow out ssh
ufw allow out dns
ufw allow out ntp
ufw deny in from any to any
ufw deny out from any to any
ufw status verbose