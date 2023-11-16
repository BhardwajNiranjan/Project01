#!/bin/bash
echo -e "\033[0;34m                                      ======== Installation In  Process ======= "
# Download the Google Chrome package
echo -e "\033[0;32m"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sleep 2s
echo -e "\033[0;33m                                      ======== Downloading Chrome Package ======= "
# Install the package using dpkg
echo -e "\033[0;35m"
sudo dpkg -i google-chrome-stable_current_amd64.deb
sleep 1s
echo -e "\033[0;32m                                  ======== Installating some misisng dependencies ======= "
# Install any missing dependencies
echo -e "\033[0;34m"
sudo apt-get -f instally
sleep 1s
echo -e "\033[0;33m                                          ======== Here Lunching Chrome Browser ======= "
# Start Google Chrome
#echo -e "\033[0;32m -----lunching google-chrome------ "
#google-chrome-stable
sleep 1s

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=




echo -e "\033[0;34m                                   +++++++++ here we are going to installing skype ++++++++++ "

echo -e "\033[0;34m                                     ========Skype-package Installation In  Process ======= "
# Download the Skype package
echo -e "\033[0;32m"
wget https://go.skype.com/skypeforlinux-64.deb
sleep 0.5s
echo -e "\033[0;33m                                                  ======== Downloading skype Package ======= "
# Install the package using dpkg
echo -e "\033[0;35m"
sudo apt install ./skypeforlinux-64.deb
sleep 1s
echo -e "\033[0;32m                                                     ======== Installating some misisng dependencies ======= "
# Install any missing dependencies
echo -e "\033[0;34m"
sudo apt-get install -f

