#!/bin/bash
echo -e "\033[0;34m"
PS3=" Please select a Number of any Package "
echo -e "\033[0;33m"
select packagename in teams skype chrome vscode anydesk
do
echo -e "\033[0;32m"
 case ${packagename} in
  teams)
    wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.5.00.10453_amd64.deb
    sudo dpkg -i teams_1.5.00.10453_amd64.deb
    sudo apt --fix-broken install
      break
    ;;
anydesk)
     wget https://download.anydesk.com/linux/anydesk_6.2.1-1_amd64.deb 
     wget https://download.anydesk.com/linux/deb/anydesk_5.5.6-1_amd64.deb
     sudo dpkg -i anydesk_*.deb
     sudo apt --fix-broken install
     anydesk
     break
    ;;

  skype)
    wget https://repo.skype.com/latest/skypeforlinux-64.deb
    sudo apt install ./skypeforlinux-64.deb
      break
    ;;
  chrome)
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome*.deb
    sudo apt-get install -f
      break
    ;;
  vscode)
    sudo apt install software-properties-common apt-transport-https wget -y
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt install code
    code --version
      break
    ;;
  
    *)
    echo -e "\033[0;33m Try again & Enter a Number "
 esac
done


  