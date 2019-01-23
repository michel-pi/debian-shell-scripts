#!/bin/bash

apt-get update && apt-get upgrade -y

apt-get install bzip2 xz-utils -y

adduser teamspeak

su teamspeak

cd /home/teamspeak

if [ -f ts3.tar.bz2 ]; then
    rm ts3.tar.bz2
fi

if [ -z "$1"]; then
    wget -e --output-document=ts3.tar.bz2 -nv https://www.teamspeak.de/download/teamspeak-3-amd64-server-linux/
else
    wget -e --output-document=ts3.tar.bz2 -nv $1
fi

tar xfvj ts3.tar.bz2

rm ts3.tar.bz2

cat >/etc/init.d/teamspeak3 <<EOL
#!/bin/sh
### BEGIN INIT INFO
# Provides: 		teamspeak3
# Required-Start: 	$local_fs $network
# Required-Stop:	$local_fs $network
# Default-Start: 	2 3 4 5
# Default-Stop: 	0 1 6
# Description: 		Teamspeak 3 Server
### END INIT INFO
 
USER="teamspeak"
DIR="/home/teamspeak/teamspeak3-server_linux_amd64"
 
case "$1" in
start)
su $USER -c "${DIR}/ts3server_startscript.sh start"
;;
stop)
su $USER -c "${DIR}/ts3server_startscript.sh stop"
;;
restart)
su $USER -c "${DIR}/ts3server_startscript.sh restart"
;;
status)
su $USER -c "${DIR}/ts3server_startscript.sh status"
;;
*)
echo "Usage: {start|stop|restart|status}" >&2
exit 1
;;
esac
exit 0
EOL

update-rc.d teamspeak3 defaults

touch /home/teamspeak/teamspeak3-server_linux_amd64/.ts3server_license_accepted

/home/teamspeak/teamspeak3-server_linux_amd64/ts3server_startscript.sh start