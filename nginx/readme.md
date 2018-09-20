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

## Permission problem ??
`
sudo find ./webroot -type f -exec chmod 664 {} + \
&& sudo find ./webroot -type d -exec chmod 775 {} + \
&& sudo chown -R www-data:www-data ./webroot
`