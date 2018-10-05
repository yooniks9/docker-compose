#!/bin/bash
# [Docker] MySQL/MariaDB Backup Daily Scripts (MAX:15 backups) By: Roy Tan @ Tentencreative | Jul 16, 2018

# Database variables (*required)
 db_user="root"
 db_password="PASSWORD"
 db_name="DB1"

# Backup path (DO NOT CHANGE)
 path="/srv/mariadb/SQLbackup/$db_name-hourly"
 logs="/srv/mariadb/logs"

# System time variables (DO NOT CHANGE)
 day=$(date +"%m.%d.%Y")
 fulldate=$(date +"%c")
 date=$(date +"%m.%d.%Y-%H:%M")

# Create directory (command)
 mkdir -p $path
 mkdir -p $logs

# Dump database into SQL file (command)
 docker exec mariadb_db_1 /usr/bin/mysqldump -u$db_user --password=$db_password $db_name > $path/$db_name-$day.sql

# Record logs (command)
 echo "[hourly] backup $db_name is completed on $fulldate" >> $logs/MySQL-hourly-backup.log

# Clean up files longer than 1 days [ 1 x 1440 = 1440 ] (command)
 find $path/*.sql -type f -mmin +1440 -exec rm {} \;