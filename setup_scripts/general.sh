# create a user named seed with password dees. 
sudo useradd -m -p sayXNZO6ttekA -s /bin/bash seed 

# change a user named root with password seedubuntu. 
sudo usermod root -p saKegetdD.KLw 

# add seed to sudo
sudo usermod -a -G sudo seed

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

#test anaconda download from github
wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
sudo bash -c "bash Anaconda3-5.3.0-Linux-x86_64.sh -b -p /opt/anaconda3"
sudo bash -c "echo 'PATH="/opt/anaconda3/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"' > /etc/environment"
sudo bash -c "echo 'ANACONDA_HOME=/opt/anaconda3/' >> /etc/environment"

sudo usermod -aG sudo seed
sudo usermod -aG root seed
sudo su seed -c "touch ~/.sudo_as_admin_successful"
sudo su seed -c "cd ~/ && unset XDG_RUNTIME_DIR && nohup jupyter notebook --NotebookApp.token='' --ip * --no-browser > ~/nohup_jupyter.out &"


# setup gdb peda
sudo git clone https://github.com/longld/peda.git /home/seed/peda
sudo echo "source /home/seed/peda/peda.py" >> /home/seed/.gdbinit

#
# setup Anaconda
#
#sudo chown -R seed: /home/seed
#sudo wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh /home/seed/anaconda3
#sudo bash -c "bash /home/seed/anaconda3/Anaconda3-5.3.0-Linux-x86_64.sh -b -p /opt/anaconda3"
#sudo bash -c "echo 'ANACONDA_HOME=/opt/anaconda3/' >> /home/seed/.bashrc"
#sudo bash -c "echo 'PATH=/opt/anaconda3/bin:$PATH' >> /home/seed/.bashrc"

# create a user named seed with password dees. 
sudo useradd -m -p sayXNZO6ttekA -s /bin/bash seed 

# change a user named root with password seedubuntu. 
sudo usermod root -p saKegetdD.KLw 


sudo su seed -c "conda install -c anaconda beautifulsoup4"
sudo su seed -c "conda install -c anaconda requests"
