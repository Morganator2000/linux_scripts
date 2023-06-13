#!/bin/sh -u
PATH=/bin:/usr/bin ; export PATH
umask 022

#Morgan Bakelmun

#Okay, you see those first three lines up there? 
#Those are required for every linux script. Running this script,
#while using your script as an argument will add those three lines
#to the beginning, so you don't have to write it out.

#TODO: check to make sure it's a valid file
file=$1

#step 1, save all that is already written in the script.

info=$(cat $1)

#step 2, add that info above.

echo "#!/bin/sh -u" > $file
echo "PATH=/bin:/usr/bin ; export PATH" >> $file
echo "umask 022" >> $file

#step 3, re-add the things written in the script.

echo -e "\n$info" >> $file
