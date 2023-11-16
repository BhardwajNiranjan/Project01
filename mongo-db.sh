#!/bin/bash
    
select action in Install Create-User Delete-User Show-Database New-Database Delete-Database       
do 
  case ${action} in
   Install)
     if [ $(dpkg -l | grep -q mongodb-org) ] 
     then
     echo "Already Installed"
     else 
     sudo apt-get install gnupg curl
     curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
     sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \  --dearmor
     echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
     sudo apt-get update 
     sudo apt-get install -y mongodb-org
     if [[ $? == 0 ]]; 
     then 
     sudo systemctl start mongod
     sudo systemctl daemon-reload
     sudo systemctl status mongod | head -n 6
     mongod --version 
     echo " installation completed "
     else 
     echo -e "\033[0;32m installation failed "
     #exit 1 
     fi 
     fi 
     ;;
Create-User)
read -p "user name: " user 
read -p " type password: "  password
mongosh <<EOF 
CreateUser() {
    mongosh <<EOF
    show dbs
    use admin
    db.createUser(
        {
            user: "$user",
            pwd: "$password",
            roles: [ { role: "userAdminAnyDatabase", db: "admin" }, "readWriteAnyDatabase" ]
        }
    )
EOF 
}
#Call the function
CreateUser
   ;;






 *)
  echo " Invalid Error "
 esac 
done
  































    