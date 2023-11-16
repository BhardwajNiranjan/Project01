if [[ $UID != 0 ]] # UID is user id or 0 is default value of root user
 then
 echo -e "\033[0;31m             !!!!!!!!!!!! ALERT !!!!!!!!!! \n ------------ Login user is not root user ------------- " 
 exit 1 # exit form condition
 fi

select packagename in copy delete
do
echo -e "\033[0;32m"
 case ${packagename} in
  copy)
        read -p " Enter file source_path " source_path 
        read -p " Enter file Destination_path "  Destination_path  
        cp $source_path $Destination_path # copy one file to another destination path
        echo -e "\033[0;32m >>>>>>>>>>>>>>>>> The Source file Copied Successufully to Destination Path <<<<<<<<<<<<<<<<<< "
        break
   ;;
  delete)
       read -p "Enter any File name to remove that given filename: " file_name
       sudo rm -r $file_name 
       echo -e "\033[0;34m >>>>>>>>>>>>>> Given File Deleted Successfully <<<<<<<<<<<<<<<"
       break
   ;;
esac
exit 1
done 