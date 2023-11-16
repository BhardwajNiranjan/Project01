#check file is char

file_path="/dev/vcs"
if  [ -c ${file_path} ]
then
echo "${file_path} is a char file"
fi
