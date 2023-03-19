#!/bin/bash
# Automated publish script that takes the changes since the last tag and FTPs them
# to the hosting site.
# May need GITHUB password, unless the private SSH key has been registered
# Definately needs the account password for FTP to do the actual upload.
# Stops if there are no changes to publish. Refreshes from GITHUB before starting.

echo -e "\033[1;33mEnter your GITHUB password next (if needed)\033[0m"
git pull

LATEST_TAG=$(git describe --tags --abbrev=0)
LATEST_TAG=$( ECHO $LATEST_TAG | sed 's/_.*//' )
NEXT_TAG=$(( $LATEST_TAG + 1 ))
DT=$( date +%FT%H%M%S )
NEXT_TAG=${NEXT_TAG}_${DT}
CURRENT_REVISION=$(git describe)
echo -e "# \n\033[1;33m Current revision is at $CURRENT_REVISION for Tag: $LATEST_TAG \033[0m"

# Don't publish files in these folders or filenames (they are for editing, not publishing):
#   /original/*
#   /README*
#   *.sh
git diff --name-only HEAD $LATEST_TAG | egrep -v '^(original|README)' | egrep -v '(.sh)$' > changedFiles.txt
#cat changedFiles.txt
if [ -s "changedFiles.txt" ] ; then 
    echo -en "\033[1;34mFiles changed: \033[0m"
    cat changedFiles.txt | wc -l
else
    echo -e "\033[5;31mNo Files changed to publish\033[0m"
    read x
    exit
fi

#echo -e "\033[34mTo create the next tag after publish: \033[0m"
#echo -e "\033[1;34mgit tag $NEXT_TAG \033[0m"

SFTP=uploadFiles.sftp

[ -f $SFTP ] && rm $SFTP
echo "sftp $1 rockw975@ftp.rockwaywellnessclinic.ca << EOF" >> $SFTP
echo "cd public_html" >> $SFTP
echo "ls -la" >> $SFTP
while read F
do
    echo "put $F $F" >> $SFTP
done < changedFiles.txt

echo "ls -la" >> $SFTP
echo "exit" >> $SFTP
echo "EOF" >> $SFTP

chmod 755 $SFTP
cat $SFTP

echo -e "\033[1;33mAbout to publish all changes since last publish. DO NOT ENTER THE PASSWORD IF NOT SURE. \nPress ^C to CANCEL, or Enter to continue\033[0m"
read x
./$SFTP

mv $SFTP $SFTP.$NEXT_TAG

git tag $NEXT_TAG
echo -e "\033[1;33mEnter your GITHUB password next (if needed)\033[0m"
git push origin $NEXT_TAG

echo -e "\033[1;34mDone!\033[0m"
read x
