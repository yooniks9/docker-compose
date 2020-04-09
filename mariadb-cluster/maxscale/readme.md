## Maxscale 2.4 with docker

ref: https://severalnines.com/database-blog/mariadb-maxscale-load-balancing-docker-deployment-part-one

```
$ docker exec -it maxscale maxctrl
 maxctrl: list servers
┌──────────┬──────────────┬──────┬─────────────┬─────────────────┬─────────────┐
│ Server   │ Address      │ Port │ Connections │ State           │ GTID        │
├──────────┼──────────────┼──────┼─────────────┼─────────────────┼─────────────┤
│ mariadb1 │ 192.168.0.91 │ 3306 │ 0           │ Master, Running │ 0-5001-1012 │
├──────────┼──────────────┼──────┼─────────────┼─────────────────┼─────────────┤
│ mariadb2 │ 192.168.0.92 │ 3306 │ 0           │ Slave, Running  │ 0-5001-1012 │
├──────────┼──────────────┼──────┼─────────────┼─────────────────┼─────────────┤
│ mariadb3 │ 192.168.0.93 │ 3306 │ 0           │ Slave, Running  │ 0-5001-1012 │
└──────────┴──────────────┴──────┴─────────────┴─────────────────┴──────────
```

- maxctrl: list servers
- maxctrl: list services
- maxctrl: list filters
- maxctrl: list sessions