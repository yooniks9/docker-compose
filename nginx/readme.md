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
`30 2 * * 1 /srv/letsencrypt/letsencrypt-auto renew >> /var/log/letsencrypt/le-renew.log`