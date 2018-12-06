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
# open port 9090 and 9999 for all communications
#
sudo ufw allow 9090
sudo ufw allow 9999

#
# setup nmap
#
sudo apt-get -y install nmap

# setup gdb peda
sudo git clone https://github.com/longld/peda.git /home/seed/peda
sudo echo "source /home/seed/peda/peda.py" >> /home/seed/.gdbinit

#
# setup Anaconda
#
sudo wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh /home/seed/anaconda3
sudo bash -c "bash /home/seed/anaconda3/Anaconda3-5.3.0-Linux-x86_64.sh -b -p /home/seed/opt/anaconda3"
sudo bash -c "echo 'ANACONDA_HOME=/opt/anaconda3/' >> /home/seed/etc/profile"
sudo bash -c "echo 'PATH=/opt/anaconda3/bin:$PATH' >> /home/seed/etc/profile"

# create a user named seed with password dees. 
sudo useradd -i -m -p sayXNZO6ttekA -s /bin/bash seed 

# change a user named root with password seedubuntu. 
sudo usermod root -p saKegetdD.KLw 


# add seed to sudo
sudo usermod -a -G sudo seed
<<seed>> ALL=(ALL) NOPASSWD:ALL
