#!/bin/bash

if [$1 -eq help]; then
    echo "options: minimal, compatible, all, nextcloud, xenforo, wordpress, ipboard"
    exit 0
fi

apt-get update && apt-get upgrade -y

apt-get install curl openssl -y

case $1 in
    minimal) apt-get install php7.0-cgi php7.0-common php7.0-curl php7.0-fpm php7.0-gd php7.0-json php7.0-mysql php7.0-opcache php7.0-xml -y
    ;;
    compatible) apt-get install php7.0-bcmath php7.0-cgi php7.0-common php7.0-curl php7.0-fpm php7.0-gd php7.0-json php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-opcache php7.0-xml php7.0-zip -y
    ;;
    all) apt-get install php7.0-bcmath php7.0-bz2 php7.0-cgi php7.0-cli php7.0-common php7.0-curl php7.0-dba php7.0-dev php7.0-enchant php7.0-fpm php7.0-gd php7.0-gmp php7.0-imap php7.0-interbase php7.0-intl php7.0-json php7.0-ldap php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-odbc php7.0-opcache php7.0-pgsql php7.0-pspell php7.0-readline php7.0-recode php7.0-snmp php7.0-soap php7.0-sqlite3 php7.0-sybase php7.0-tidy php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip -y
    ;;
    nextcloud) apt-get install ffmpeg -y
               apt-get install php-imagick -y
               apt-get install memcached php-memcached -y
               apt-get install php7.0-bz2 php7.0-cgi php7.0-common php7.0-curl php7.0-fpm php7.0-gd php7.0-intl php7.0-json php7.0-mbstring php7.0-mysql php7.0-opcache php7.0-xml php7.0-zip -y
    ;;
    xenforo) apt-get install php7.0-cgi php7.0-common php7.0-curl php7.0-fpm php7.0-gd php7.0-json php7.0-mysql php7.0-opcache php7.0-xml -y
    ;;
    wordpress) apt-get install php7.0-cgi php7.0-common php7.0-fpm php7.0-gd php7.0-json php7.0-mysql php7.0-opcache php7.0-xml -y
    ;;
    ipboard) apt-get install php7.0-cgi php7.0-common php7.0-curl php7.0-fpm php7.0-gd php7.0-json php7.0-mbstring php7.0-mysql php7.0-opcache php7.0-xml -y
    ;;
esac
