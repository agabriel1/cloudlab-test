#!/bin/bash
set -x

#
# update Ubuntu's repository
#
sudo apt-get -y update

# Adding the SSH server
sudo apt-get install openssh-server openssh-client
sudo cp /etc/ssh/sshd_config  /etc/ssh/sshd_config.original_copy

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
sudo useradd -m -s /bin/bash seed
sudo passwd dees
#-p dees

# create a user named root with password seedubuntu. 
sudo useradd -m -s /bin/bash root 
sudo passwd seedubuntu
#-p seedubuntu

# add seed to sudo
sudo usermod -a -G sudo seed
