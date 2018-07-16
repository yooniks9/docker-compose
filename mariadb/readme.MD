
## Backup
docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > backup.sql

## Restore
cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE

## cronjob
`0 9 * * * /mnt/mariadb/scripts/backup.sh > /dev/null 2>&1`