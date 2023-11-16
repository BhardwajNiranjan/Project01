#!/bin/bash
Install() {
     if [$(dpkg -l | grep -q mongod)]; then     
     echo "Already Installed"
     else 
     sudo apt-get install gnupg curl
     curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
     sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \  --dearmor
     echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
     sudo apt-get update 
     sudo apt-get install -y mongodb-org
     if [[ $? == 0 ]]; then 
     sudo systemctl start mongod
     sudo systemctl daemon-reload
     sudo systemctl status mongod | head -n 6
     mongod --version 
     else 
     echo -e "\033[0;32m installation failed "
     exit 1 
     fi 
     fi 
     echo " installation completed "
}

CreateUser() {
    read -p "Enter username: " user 
    read -p "Enter password: " password
     read -p "Enter Database Name: " DBName
     mongosh <<EOF
        show dbs
        use $DBName
        db.createUser(
        {
        user: "$user",
        pwd: "$password",
        roles: [ { role: "userAdminAnyDatabase", db: "admin" }, "readWriteAnyDatabase" ]
        }
        )
EOF
echo " <<<<<< NewUser: "$user" in Database "$DBName" Created Successfully >>>>>> "
}

Delete-User() { 
    read -p "Enter Database for Deleting: " UName
    read -p "Enter Database: " DBName
    mongosh <<EOF
        show dbs
        use $DBName
        db.dropuser("$UName")
EOF

}
Delete-Database() { 
    read -p "Enter Database for Deleting: " DBName
    mongosh <<EOF
        show dbs
        use $DBName
        db.dropdatabase("$DBName")
EOF

}



select task in Install CreateUser  Show-Database Delete-User  Delete-Database
do
    case $task in
        "Install")
            Install
            break
            ;;
        "CreateUser")
            createUser
            break
            ;;
        "Delete-Database")
          Delete-Database
            mongosh
            break
            ;;
        "Show-Database")
        
        mongosh <<EOF  
            show dbs
EOF
            break
            ;;
        *)
            echo "Invalid option. Try again."
            ;;
    esac
done
