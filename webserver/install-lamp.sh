#!/bin/bash

# Update

apt-get update
apt-get -y upgrade

# Helpful programs

apt-get -y install curl nano unzip wget

# OpenSSL

apt-get install -y openssl

# Install apache

apt-get -y install apache2 apache2-utils

# Install MariaDB

apt-get -y install mariadb-client mariadb-server

mysql_secure_installation

systemctl restart mariadb
systemctl enable mariadb

# Install PHP
# Remove unused modules on small hardware

apt-get install php7.0 php-pear php7.0-common php7.0-fpm php7.0-cli php7.0-curl php7.0-gd php7.0-geoip php7.0-intl php7.0-json php7.0-imap php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-opcache php7.0-readline php7.0-xml php7.0-xsl php7.0-zip php7.0-bz2 php7.0-gd php7.0-soap libapache2-mod-php7.0 -y

# Restart apache

service apache2 restart

# Install phpMyAdmin

wget https://files.phpmyadmin.net/phpMyAdmin/4.7.5/phpMyAdmin-4.7.5-english.zip -nv -P /var/www/html/

unzip /var/www/html/phpMyAdmin-4.7.5-english.zip -d /var/www/html/

rm /var/www/html/phpMyAdmin-4.7.5-english.zip

mv /var/www/html/phpMyAdmin-4.7.5-english/ /var/www/html/phpmyadmin/

# Install a theme

wget https://files.phpmyadmin.net/themes/fallen/0.5/fallen-0.5.zip -nv -P /var/www/html/phpmyadmin/themes/

unzip /var/www/html/phpmyadmin/themes/fallen-0.5.zip -d /var/www/html/phpmyadmin/themes/

rm /var/www/html/phpmyadmin/themes/fallen-0.5.zip

chmod -R u=rwx,g=rwx,o=r /var/www/html/

# Apache Modules

a2enmod php7.0
a2enmod rewrite
a2enmod deflate

service apache2 restart

# Create a MySql user for web access

echo "Use these commands to create a new mysql user for web access"

echo "CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';"
echo "GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';"
echo "FLUSH PRIVILEGES;"
echo "quit;"

mysql -u root -p