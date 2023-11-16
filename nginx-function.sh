#!/bin/bash
sudo apt update -y 
read -p "enter package name " package_name # take input package name from users

function install(){
echo "installing $package_name "
sudo apt install $package_name 
if [[ ! $? == 0 ]]
then 
sudo apt install $package_name
else
echo " please try again $package_name installation "
fi 

} 
