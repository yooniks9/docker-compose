## PHP mods
bcmath bz2 calendar curl iconv intl mbstring mcrypt mysqli opcache pdo_mysql pdo_pgsql pgsql soap zip gd ldap exif memcached redis zlib

## Apache mods
rewrite ssl(production)

## Etc
composer

## Staging start
`docker-compose up -d`

## Production with SSL
`docker-compose -f docker-compose-prod.yml up -d`