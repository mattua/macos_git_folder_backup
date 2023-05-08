#FILE=scheduled_backup_jo2b.sh
dir=.git_backup_scripts
mkdir -p $dir
FILE=$dir/backup.sh
#FILE=git_backup.$(echo -n $PWD | shasum -a 256 | awk '{ print $1 }').sh
echo $FILE
touch $FILE
chmod 777 $FILE
contents="hello world"
echo "$PWD"
cat > $FILE <<- EOM
cd $PW
git init
git add .
git commit -m "auto backup"
EOM

(crontab -l; echo "*/5 * * * * $PWD/$FILE")|awk '!x[$0]++'|crontab -


echo $contents

#option to update the schedule with input param, or suspend with input param
#works on any folder
#get current folder name
#create script of that names hash
#create function
#git init
#check and abort if folder contains a git repo
