#!/bin/bash

# Update

apt-get update
apt-get -y upgrade

# Install dependencies
apt-get install bzip2 xz-utils -y

# Add a user

adduser teamspeak

# Switch user

su teamspeak

cd /home/teamspeak

# download teamspeak

wget -e --output-document=ts3.tar.bz2 -nv https://files.teamspeak-services.com/releases/server/3.5.1/teamspeak3-server_linux_amd64-3.5.1.tar.bz2

# unzip

tar xfvj ts3.tar.bz2

rm ts3.tar.bz2

# start

./ts3server_startscript.sh start

# move teamspeak3 into /etc/init.d/
# update-rc.d teamspeak3 defaults