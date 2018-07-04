## Run the docker
`docker-compose up -d`

## Download Octobercms and extract to html
`wget https://codeload.github.com/octobercms/install/zip/master`

## unzip
`unzip master`

## rename
`mv install-master html`

## change ownership
`sudo chown -R ubuntu:www-data html`

## change file permission
`sudo find . -type f -exec chmod 664 {} +`

## change folder permission
`sudo find . -type d -exec chmod 775 {} +`

## run installation
http://YOURIP:8080/install.php

## create env file
`docker exec CHANGETHIS-CONTAINERID /usr/local/bin/php /var/www/html/artisan october:env`


### Permission issue??
  * `sudo usermod -aG www-data $USER`
  * `sudo chown -R www-data:www-data .`
  * `sudo find . -type f -exec chmod 664 {} +`
  * `sudo find . -type d -exec chmod 775 {} +`
