#!/bin/bash
brew install git
read -p 'frequency in minutes (enter 0 to cancel and delete backups): ' freq
PWD2=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo working in $PWD2
dir=$PWD2/.git_backup_scripts
mkdir -p "$dir"
FILE=$dir/backup.sh
echo $FILE
touch "$FILE"
chmod +x "$FILE"
cat > "$FILE" <<- EOM
cd "$PWD2"
git init
git add .
git commit -m "auto backup"
EOM

if [[ $freq -gt 0 ]]
then
(crontab -l|grep -v "$PWD2"; echo "*/$freq * * * * \"$FILE\" >> \"$dir/script.log\" 2>&1")|awk '!x[$0]++'|crontab -
else
 rm -rf $dir
 rm -rf $PWD2/.git
(crontab -l|grep -v "$PWD2";)|awk '!x[$0]++'|crontab -
fi
