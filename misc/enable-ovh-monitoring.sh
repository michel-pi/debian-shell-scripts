#!./bin/bash

apt-get install iptables-persistent -y

iptables -I INPUT -s 92.222.184.0/24 -j ACCEPT
iptables -I INPUT -s 92.222.185.0/24 -j ACCEPT
iptables -I INPUT -s 92.222.186.0/24 -j ACCEPT
iptables -I INPUT -s 167.114.37.0/24 -j ACCEPT
iptables -I INPUT -s 51.77.137.155/32 -j ACCEPT

iptables -I OUTPUT -d 92.222.184.0/24 -j ACCEPT
iptables -I OUTPUT -d 92.222.185.0/24 -j ACCEPT
iptables -I OUTPUT -d 92.222.186.0/24 -j ACCEPT
iptables -I OUTPUT -d 167.114.37.0/24 -j ACCEPT
iptables -I OUTPUT -d 51.77.137.155/32 -j ACCEPT

iptables-save > /etc/iptables/rules.v4