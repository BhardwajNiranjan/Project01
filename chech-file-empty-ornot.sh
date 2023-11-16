#! /bin/bash
 read -p "Enter File Name to test: " fname
if [ -e $fname ] # e - for file exit 
  then
  if [ -f $fname ] # f - regular file 
     then
     if [ -s $fname ] # s - non empty file
       then
       echo "$fname is not empty file"
       else
       echo "$fname is empty file"
     fi
       else
       echo "It is not a regular file"
  fi
    else
    echo "$fname does not exist"
fi 