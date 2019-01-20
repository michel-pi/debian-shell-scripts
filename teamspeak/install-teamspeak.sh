#!/bin/bash

apt-get update
apt-get -y upgrade

apt-get install bzip2 xz-utils -y

adduser teamspeak

su teamspeak

cd /home/teamspeak

wget -e --output-document=ts3.tar.bz2 -nv https://files.teamspeak-services.com/releases/server/3.5.1/teamspeak3-server_linux_amd64-3.5.1.tar.bz2

tar xfvj ts3.tar.bz2

rm ts3.tar.bz2

./ts3server_startscript.sh start

# move teamspeak3 into /etc/init.d/
# execute update-rc.d teamspeak3 defaults