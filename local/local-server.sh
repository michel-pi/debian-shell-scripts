#!/bin/sh

echo "updating system"

apt update
apt upgrade -y

# install common packages

echo "installing common packages"

apt install \
curl \
wget \
openssl \
git \
nano \
bzip2 \
xz-utils \
unzip \
apt-transport-https \
dirmngr \
-y

echo "installing audio and image tools"

apt install php-imagick ffmpeg -y

echo "downloading virtualmin installer"

wget -nv -nc --output-document virtualmin-installer.sh http://software.virtualmin.com/gpl/scripts/install.sh

chmod +777 virtualmin-installer.sh

echo "installing virtualmin"

/bin/sh virtualmin-installer.sh -f -v

rm virtualmin-installer.sh

echo "installing php modules"

apt install \
php7.0-bcmath \
php7.0-bz2 \
php7.0-cgi \
php7.0-cli \
php7.0-common \
php7.0-curl \
php7.0-fpm \
php7.0-gd \
php7.0-imap \
php7.0-intl \
php7.0-json \
php7.0-mbstring \
php7.0-mcrypt \
php7.0-mysql \
php7.0-opcache \
php7.0-soap \
php7.0-xml \
php7.0-zip \
-y

echo "installing mono"

apt install apt-transport-https dirmngr gnupg ca-certificates -y
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list

apt update

apt install \
mono-devel \
mono-dbg \
referenceassemblies-pcl \
ca-certificates-mono \
mono-complete \
-y

echo "installing .NET Core 2.2"

apt install gpg -y

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/9/prod.list
mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
chown root:root /etc/apt/sources.list.d/microsoft-prod.list

apt install apt-transport-https -y
apt update
apt install dotnet-runtime-2.2 -y

echo "updating system"

apt update
apt upgrade -y
