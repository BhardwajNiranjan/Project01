#!/bin/bash
read -p " enter filename " filename

if [[ -e $filename ]]
then
echo " $filename file is exit "
else 
echo " $filename file is not exit "
fi 