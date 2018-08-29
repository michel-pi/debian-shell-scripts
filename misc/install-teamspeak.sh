#!/bin/bash

# Update

apt-get update
apt-get -y upgrade

# Add a user

adduser --gecos "" --create-home teamspeak

# Switch user

su teamspeak

cd /home/teamspeak

# download teamspeak

wget -e --output-document=ts3.tar.bz2 -nv http://dl.4players.de/ts/releases/3.3.1/teamspeak3-server_linux_amd64-3.3.1.tar.bz2

# unzip

tar xfvj ts3.tar.bz2

rm ts3.tar.bz2

# start

./ts3server_startscript.sh start