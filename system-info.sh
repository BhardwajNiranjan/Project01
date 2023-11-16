#!/bin/bash
echo -e "\033[0;34m"
PS3=" To get details about listed items select a Number "
echo -e "\033[0;36m"
select task in  system-details  current-user ip-address 
do
case ${task}  in 
     system-details)
     u="$(uname -a)"
     echo -e "\033[0;35m  Here Given Below Line are Showing User'Nmae & System Information: \n<<< $u  >>> " 
     break
     ;;
     current-user)
     w="$(who)"
     echo -e " The Current User of System is: \nuser: <<<<< $w >>>>> " 
     break
     ;; 
     ip-address)
echo -e "\033[0;35m  The IPv4 Address of Current System: \nIP-Address is: "
     ip_address=$(ip add | grep -oP 'inet \K[0-9.]+')
     echo "IPv4 Address: $ip_address "
     break 
     ;; 
*)
     echo -e "\033[0;32m Wrong Entered & Select a Number "

esac
done 