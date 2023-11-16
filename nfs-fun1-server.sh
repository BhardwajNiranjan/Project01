#!/bin/bash
# SERVER CONFIGURATION 
echo "------------>> We are going to Configure a NFS-SERVER <<------------"
sudo apt update 
function installnfs(){
         sudo apt install nfs-kernel-server
   if [ $? -eq 0 ]
        then
         sudo systemctl start nfs-kernel-server.service
         sudo systemctl status nfs-kernel-server.service
        else
         echo " installation failed "
         exit 1
   fi 
}
sleep 1.5
whereis nfs &&  which nfs
 
function configurenfs(){
sudo mkdir /shared1/myshareddir
#Set permissions so that any user on the client machine can access the folder
sudo chown nobody:nogroup /shared1/myshareddir #no-one is owner
sudo chmod 777 /mnt/myshareddir # give full permission
echo "/shared1/myshareddir 192.168.65.129 (rw,sync,no_subtree_check)" > /etc/exports
sudo exportfs -a #making the file share available
sudo systemctl restart nfs-kernel-server #restarting the NFS kernel
#apply new configuration:-
sudo exportfs -rv
}


installnfs 
configurenfs