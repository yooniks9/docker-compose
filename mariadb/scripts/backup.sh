#!/bin/bash
# [Docker] MySQL/MariaDB Backup Daily Scripts (MAX:15 backups) By: Roy Tan @ Tentencreative | Jul 16, 2018

# Database variables (*required)
 db_user="root"
 db_password="password"
 db_name="db1"
# db_name2="db2"

# Backup path (DO NOT CHANGE)
 path="/mnt/mariadb/SQLbackup/$db_name-daily"
# path2="/mnt/mariadb/SQLbackup/$db_name2-daily"
 logs="/mnt/mariadb/logs"

# System time variables (DO NOT CHANGE)
 day=$(date +"%m.%d.%Y")
 fulldate=$(date +"%c")
 date=$(date +"%m.%d.%Y-%H:%M")

# Create directory (command)
 mkdir -p $path
# mkdir -p $path2
 mkdir -p $logs

# Dump database into SQL file (command)
 docker exec mariadb_db_1 /usr/bin/mysqldump -u$db_user --password=$db_password $db_name > $path/$db_name-$day.sql
# docker exec mariadb_db_1 /usr/bin/mysqldump -u$db_user --password=$db_password $db_name2 > $path2/$db_name2-$day.sql

# Record logs (command)
 echo "[daily] backup $db_name is completed on $fulldate" >> $logs/MySQL-daily-backup.log
# echo "[daily] backup $db_name2 is completed on $fulldate" >> $logs/MySQL-daily-backup.log

# Clean up files longer than 15 days [ 15 x 1440 = 21600 ] (command)
 find $path/*.sql -type f -mmin +21600  -exec rm {} \;
# find $path2/*.sql -type f -mmin +21600  -exec rm {} \;
