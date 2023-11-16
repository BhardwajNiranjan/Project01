#!/bin/bash
#disk_usage=$(df -h | awk  '{print $5}' | sed 's/%//')

if [ "${disk_usage}" -gt  30 ]
then
echo -e "\033[0;31m <<<<<<<< Alert ${disk_usage} is High using Storage over Limited Range >>>>>>>> "
else 
echo -e "\033[0;34m <<<< Condition is Normal; NO need to take action >>>> "
fi 