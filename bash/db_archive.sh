#!/bin/bash
db_login="root"
db_password="masterkey"
db_host="localhost"
backup_dir="/home/mysql_backup"

#Get data in yyyy-mm-dd formate
date="$(date +"%Y-%m-%d")"
month="$(date +"%Y-%m")"

#Don't backup these databases
db_skip="test information_schema mysql"

#Create directory if not exist
if !([ -e $backup_dir ]); then
    mkdir -p $backup_dir
fi

#Get all gatabase
db_list="$(mysql -u $db_login -h $db_host -p$db_password -Bse 'show databases')"

for db in $db_list
do
    db_flag=true

    if [ "$db_skip" != "" ]; then
	for i in $db_skip
	do
	    [ "$db" == "$i" ] && db_flag=false || :
	done
    fi

    if [ "$db_flag" == true ]; then

	dest_path="$backup_dir/$db/$month"
	file_sql="$db.$date.sql"
	file_arch="$db.$date.tgz"

	if [ x$1 == x"month" ]; then
	    dest_path="$backup_dir/$db"
	    file_sql="$db.$month.sql"
	    file_arch="$db.$month.tgz"
	fi

	if !([ -d $dest_path ]); then
	    mkdir -p $dest_path
	fi

	cd $dest_path

	for f in $del_list; do
	    rm $dest_path/$f
	done
	#Dump database to sql file
	mysqldump -u $db_login -p$db_password $db > $file_sql

	tar czf $file_arch $file_sql

	if ([ -e $file_arch ]); then
	    rm $file_sql
	fi
    fi

done

#Change owner and permissions to directory
chown 0.0 -R $backup_dir
chmod 0660 $backup_dir
