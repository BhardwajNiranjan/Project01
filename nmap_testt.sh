#!/bin/bash
# Creator : Niranjan Bhardwaj
# Date    : 21/03/2024
# Language: BashScript
# Purpose : RunSome Function and Excute Command to Perform their Task to Scan a Network,Information About a Domain, DNS Zone File, 
#           Active Server, Domain User-Name,Active Services, Ports, Running OS, Serives Versions                                    
# GitHub  : https://github.com/BhardwajNiranjan
# linkedin: https://www.linkedin.com/in/niranjan-bhardwaj-64577a185 

echo -e "\033[0;32mCreator : Niranjan Bhardwaj \nDate    : 22/03/2024 \nLanguage: BashScript \nPurpose : To Scan Target with their Vunlerability like as Open Ports, Running Services, Port exploitation using Nmap Scripts or Autonomous Scan..... \nGitHub  : https://github.com/BhardwajNiranjan \nlinkedin: https://www.linkedin.com/in/niranjan-bhardwaj-64577a185
"
echo -e "\033[0;34m"
#login as root user.......
if [[ ! ${UID} -eq 0 ]]; then
    echo -e "\033[0;31mInvalid: The login user is not root."
fi

#Display Menu.....
Display_Menu(){
            echo "Choose one Option to Perform Action....."
            echo "1. See Open Ports, Running Services, OS, MAC Address, Service Version, (Select 1)..."
            echo "2. Use Manual Nmap Script to Exploit Ports or Running Services...."
            echo "3. To Perform Autonomous Scan to Exploit Ports or Running Services...."
            echo "4. Exit Form Script"
            read -p "Enter your choice (1 or 2 or 3): " choice
}

# Function to select a file by sequence number
Basic_Nmap_Scan() {
            read -p "Enter a Host//IP: " target
            nmap -sV ${target}
}

# Function to perform Nmap scan using selected script
perform_nmap_scan() {
            local target=$1
            local port=$2
            local file=$3 
            echo "Showing all Scripts..."
            ls /usr/share/nmap/scripts/  
        read -p "Enter the script name you want to use for the scan: " script_name
            echo "Performing Nmap scan with script: $script_name"
        nmap -sS --script="$script_name" -v "$target" "$port" -sV -O -oN "$file"
}

Autonomous_Scan(){
            read -p "Enter Host/IP: " target
            read -p "Enter Port_No: " port
            read -p "Enter Output File Name: " file
            echo "Performing Autonomous Scan......."
            nmap -sS -sC -v "$target" "$port" -sV -O -oN "$file"
}

# Main script
main() {
    while true; do
            Display_Menu
            read -p "Enter your choice:" choice  
        case $choice in
            1)
            Basic_Nmap_Scan 
            ;;
            2)
            read -p "Enter target: " target
            read -p "Enter port: " port
            read -p "Enter output file name: " file
            perform_nmap_scan "$target" "$port" "$file"
            ;;
            3)
            Autonomous_Scan 
            ;;
            4)
            exit 1
            ;;
            *)
            echo "Invalid option. Exiting..."
    
            ;;
        esac
done 
}
main