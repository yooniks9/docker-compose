
## Backup
docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > backup.sql

## Restore
cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE

## cronjob
```bash
0 * * * * /srv/mariadb/scripts/hourly.sh > /dev/null 2>&1
0 9 * * * /srv/mariadb/scripts/daily.sh > /dev/null 2>&1
0 6 1 * * /srv/mariadb/scripts/monthly.sh > /dev/null 2>&1
```