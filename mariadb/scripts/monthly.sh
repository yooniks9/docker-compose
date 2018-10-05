#!/bin/bash
# [Docker] MySQL/MariaDB Backup Daily Scripts (MAX:15 backups) By: Roy Tan @ Tentencreative | Jul 16, 2018

# Database variables (*required)
 db_user="root"
 db_password="PASSWORD"
 db_name="DB1"
 # db_name2="DB2"

# Backup path (DO NOT CHANGE)
 logs="/srv/mariadb/logs"
 path="/srv/mariadb/SQLbackup/$db_name-monthly"
 # path2="/srv/mariadb/SQLbackup/$db_name2-monthly"

# System time variables (DO NOT CHANGE)
 day=$(date +"%m.%d.%Y")
 fulldate=$(date +"%c")
 date=$(date +"%m.%d.%Y-%H:%M")

# Create directory (command)
 mkdir -p $logs
 mkdir -p $path
 # mkdir -p $path2

# Dump database into SQL file (command)
 docker exec mariadb_db_1 /usr/bin/mysqldump -u$db_user --password=$db_password $db_name > $path/$db_name-$day.sql
 # docker exec mariadb_db_1 /usr/bin/mysqldump -u$db_user --password=$db_password $db_name2 > $path2/$db_name2-$day.sql

# Record logs (command)
 echo "[monthly] backup $db_name is completed on $fulldate" >> $logs/MySQL-monthly-backup.log
 # echo "[monthly] backup $db_name2 is completed on $fulldate" >> $logs/MySQL-monthly-backup.log

# Clean up files longer than 180 days [ 180 x 1440 = 259200 ] (command)
 find $path/*.sql -type f -mmin +259200 -exec rm {} \;
 # find $path2/*.sql -type f -mmin +259200 -exec rm {} \;