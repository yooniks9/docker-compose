## PHP mods
bcmath bz2 calendar curl iconv intl mbstring mcrypt mysqli opcache pdo_mysql pdo_pgsql pgsql soap zip gd ldap exif memcached redis zlib

## Apache mods
rewrite ssl(production)

## Staging start
`docker-compose up -d`

## Production with SSL
`docker-compose -f docker-compose-prod.yml up -d`

## working directory
`./webroot/public`

## customize your php vars under ./config/custom.ini
- max_input_vars = 1000000
- memory_limit = 128M
- upload_max_filesize = 32M
- post_max_size = 32M
- max_execution_time = 300
- max_input_time = 300
- short_open_tag = off
- realpath_cache_size = 5242880

## composer
`docker exec $DOCKERNAME composer require $COMPOSERMOD`

* enable symbolic link within webroot folder