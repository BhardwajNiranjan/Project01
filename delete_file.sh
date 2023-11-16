#!/bin/bash
: '
   Owner   : Niranjan Bhardwaj.
   Subject : Take input of a filname from User for delete that file.
   Purpose : to delete unwanted file in  less time. 
'

read -p "Enter any File name to remove that given filename: " file_name
read -p "Enter  directory name to remove that given filename: " dir_name
if [[ $file_name ]]
sudo rm -r $file_name 
echo -e "\033[0;34m >>>>>>>>>>>>>> Given File Deleted Successfully <<<<<<<<<<<<<<<"