#!/bin/bash

function install(){
    package_name=$1
    if  dpkg -l | grep -q $package_name; then
        echo " $package_name is already installed "
     else
        sudo apt  install $package_name -y 
        sudo systemctl status $package_name
      if [[ $? == 0 ]]; then
        echo " $package_name installed successfully "
        else 
        echo " $package_name installed failed "
        exit 1
      fi 
    fi
  }  
 
 install "ssh" 
 
u=$(users)
read -p " enter full path of sharing file: "  file
sudo scp /home/$u/$file* sshpass -p "mypass123" test@192.168.1.203:/home/test/Downloads

