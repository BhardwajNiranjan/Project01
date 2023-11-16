#!/bin/bash

CreateUser() {
    read -p "user name: " user 
    read -p " type password: " password
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
select task in CreateUser Quit
do
    case $task in
        "CreateUser")
            createUser
            ;;
        "Quit")
            echo "Exiting script."
            break
            ;;
        *)
            echo "Invalid option. Try again."
            ;;
    esac
done