#!/bin/sh -u
PATH=/bin:/usr/bin ; export PATH
umask 022

#Morgan Bakelmun

#Okay, you see those first three lines up there?
#Those are required for every linux script. Running this script
#while using your script as an argument will add those three lines
#to the beginning, so you don't have to write it out.

file=$1

#step 1, make sure that the argument is a valid extension.

if [[ "$file" != *.sh && "$file" != *.txt ]]; then
	echo "Invalid file extension. You can only add this to .sh and .txt files"
	exit 1
fi

#step 2, save everything that is already written in the script.

info=$(cat $1)

#step 3, add that info above. Note that this temporarily removes the file contents.

echo "#!/bin/sh -u" > $file
echo "PATH=/bin:/usr/bin ; export PATH" >> $file
echo "umask 022" >> $file

#step 4, re-add the things written in the script.

echo -e "\n$info" >> $file
