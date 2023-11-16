#!/bin/bash
# NFS SERVER AT SERVER SIDE CONFIGURATION----
if [[ $UID != 0 ]]; then
     echo " pls login as root user "
     exit 1
fi
sudo apt-get install nfs-server -y
if [[ "which  nfs" == "/usr/bin/nfs"  ]]; then
    if [[ $? == 0 ]]; then 
       systemctl status nfs 
       systemctl enable rpcbind, nfs-server
       systemctl start rpcbind, nfs-server, rpc-statd, nfs-idmap
       systemctl status rpcbind, nfs-server, rpc-statd, nfs-idmap
       echo " nfs-server services installation successfully" 
       else
       echo " nfs-server installation failed "
    fi 
    exit 1
fi 


#make directory or give full permission
if [[ $? == 0 ]]; then 
       cd / && sudo mkdir server1 && sudo chmod 777 /server1/
       cd server1 && sudo mkdir sharefolder && sudo chmod 777 /server/sharefolder/ && cd sharefolder && pwd
 #check permission
       ls -ld /server1/
fi 

# in modify file add ip address of server or give full access to accessing data. /apps <ip_allow>(rw,sync, no_root_squash)
#sudo vi /etc/export - type here:- /server/apps *(rw,sync, no_root_squash)
#and save it........
echo " ############## now we are creating a sharing directory with full permission #############"
echo " ********* starting ********** "
sudo vi /etc/export
sudo cat > /etc/export << EOF
/server/apps *(rw,sync, no_root_squash)
EOF
echo " ********* ending ********** "
#then run this command:-
 exportfs -rv
systemctl status nfs ``