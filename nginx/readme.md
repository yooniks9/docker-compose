## reload nginx config
`docker exec -i nginx_webserver_1 /etc/init.d/nginx reload`

## SSL Enhancement
`openssl dhparam -out certs/dhparams.pem 2048`

## Install letsencrypt
`git clone https://github.com/letsencrypt/letsencrypt /srv/letsencrypt`

## create shell certbot command
`sudo ln -s /srv/letsencrypt/letsencrypt-auto /bin/certbot`

## generate ssl
`certbot certonly -a webroot --webroot-path=/srv/nginx/webroot -d example.com`

## sudo cronjob -e
`30 2 * * 1 /bin/certbot renew >> /var/log/letsencrypt/le-renew.log`

## crontab -e (create 7 days backup of config)
```bash
0 9 * * mon cp -R /srv/nginx/conf.d/* /srv/nginx/conf.d.backup/01MON/.
0 9 * * tue cp -R /srv/nginx/conf.d/* /srv/nginx/conf.d.backup/02TUE/.
0 9 * * wed cp -R /srv/nginx/conf.d/* /srv/nginx/conf.d.backup/03WED/.
0 9 * * thu cp -R /srv/nginx/conf.d/* /srv/nginx/conf.d.backup/04THU/.
0 9 * * fri cp -R /srv/nginx/conf.d/* /srv/nginx/conf.d.backup/05FRI/.
0 9 * * sat cp -R /srv/nginx/conf.d/* /srv/nginx/conf.d.backup/06SAT/.
0 9 * * sun cp -R /srv/nginx/conf.d/* /srv/nginx/conf.d.backup/07SUN/.
```

## Permission problem ??
`
sudo find ./webroot -type f -exec chmod 664 {} + \
&& sudo find ./webroot -type d -exec chmod 775 {} + \
&& sudo chown -R www-data:www-data ./webroot
`
