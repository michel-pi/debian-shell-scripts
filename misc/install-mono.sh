#!./bin/bash

apt-get update
apt-get upgrade -y

apt install dirmngr -y

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

echo "deb http://download.mono-project.com/repo/debian stretch main" | sudo tee /etc/apt/sources.list.d/mono-official.list

sudo apt-get update

sudo apt-get install mono-devel mono-complete mono-dbg referenceassemblies-pcl ca-certificates-mono mono-xsp4 -y

apt-get upgrade -y