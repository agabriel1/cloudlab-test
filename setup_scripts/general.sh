#!/bin/bash
set -x

#
# update Ubuntu's repository
#
sudo apt-get -y update

#
# setup nmap
#
sudo apt-get -y install nmap

# setup gdb peda
wget http://ropshell.com/peda/peda.tar.gz
tar zxvf peda.tar.gz
echo "source ~/peda/peda.py" >> ~/.gdbinit

#
# setup Anaconda
#
wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
sudo bash -c "bash Anaconda3-5.3.0-Linux-x86_64.sh -b -p /opt/anaconda3"
sudo bash -c "echo 'ANACONDA_HOME=/opt/anaconda3/' >> /etc/profile"
sudo bash -c "echo 'PATH=/opt/anaconda3/bin:$PATH' >> /etc/profile"

# create a user named seed with password dees. 
sudo useradd -m -p dees -s /bin/bash seed

# create a user named root with password seedubuntu. 
sudo useradd -m -p seedubuntu -s /bin/bash root

# add seed to sudo
sudo usermod -a -G sudo seed