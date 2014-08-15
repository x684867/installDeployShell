#!/bin/bash
#
# Vagrant Setup Script for deployShell (Phase 1)
# (c) 2014 Sam Caldwell.  MIT License
#
# This script is executed by Vagrant to perform basic deployShell setup.
#
echo "updating..."
cat > ~/deployed_by_vagrant.sh << EOF
#
# Profile tweaks set by vagrant deployment script.
#
export APT_OPTS="DEBIAN_FRONTEND=noninteractive" 
EOF
sudo su -c 'mv ~/deployed_by_vagrant.sh /etc/profile.d'
sudo su -c 'source . /etc/profile'

#sudo $APT_OPTS apt-get update -y --fix-missing || exit 1
#sudo $APT_OPTS apt-get upgrade -y --fix-missing || exit 1
#sudo $APT_OPTS apt-get install -y curl || exit 1
#sudo $APT_OPTS apt-get install python-pip -y || exit 1
#sudo $APT_OPTS apt-get install python-dev -y || exit 1

cat > /etc/banner << EOF

Welcome to SamCaldwell.net...
          _____                     ____ 
         /\    \                   /\   \      
        /::\    \                 /::\   \  
       /::::\    \               /::::\   \
      /::::::\    \             /::::::\   \
     /:::/\:::\    \           /::::::::\   \    
    /:::/__\:::\    \         /::::/\::::\   \   
    \:::\   \:::\    \       /::::/  \::::\   \ 
  ___\:::\   \:::\    \     /::::/   /\::::\   \ 
 /\   \:::\   \:::\    \   /::::/   /  \::::\   \ 
/::\   \:::\   \:::\____\ /::::/   /    \::::\___\
\:::\   \:::\   \::/    //::::/___/      \:::/   /
 \:::\   \:::\   \/____/ \::::\   \       \:/___/    
  \:::\   \:::\    \      \::::\   \            
   \:::\   \:::\____\      \::::\   \           
    \:::\  /:::/    /       \::::\   \          
     \:::\/:::/    /         \::::\   \         
      \::::::/    /           \::::\___\      
       \::::/    /             \::::|||||      
        \::/    /               \::/    /  
         \/____/                 \/____/

____________________________________________________

(c) 2014 Sam Caldwell.  All Rights Reserved.
_______________________________________________

EOF
sed -i -e 's/#Banner \/etc\/issue.net/Banner \/etc\/banner/' /etc/ssh/sshd_config || exit 1
service ssh restart || exit 1
exit 0