#!/bin/bash
sudo apt update

      function installclient(){
               sudo apt install nfs-common -y
        if [[ $? == 0 ]];
        then 
            systemctl status rpcbind
            systemctl start nfs-lock
            systemctl enable nfs-lock
            systemctl restart nfs-config
               sudo mkdir /var/locally-mounted #Mounting the NFS File Share Temporarily 
               sudo mount -t nfs-server-ip:/mnt/myshareddir /var/locally-mounted #Mount the file share by running the mount command, 
               mount && df -h # To verify that the NFS share is mounted successfully,

               #Mounting NFS File Shares Permanently
               sudo mkdir /var/locally-mounted #Create a local directory that will be used to mount the file share. 
               echo "{IP of NFS server}:{folder path on server} /var/locally-mounted nfs defaults 0 0" > /etc/fstab

               #Now mount the file share using the following command
               mount /var/locally-mounted #he next time the system starts, the folder will be mounted automatically.
               mount nfs-server-ip:/mnt/myshareddir 
            
            exit 1
       fi 
}
installclient