FROM php:7.1-apache
MAINTAINER yooniks9@gmail.com

# Install PHP extensions
RUN buildDeps=" \
    default-libmysqlclient-dev \
    libbz2-dev \
    libmemcached-dev \
    libsasl2-dev \
    " \
    runtimeDeps=" \
    curl \
    git \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libldap2-dev \
    libmcrypt-dev \
    libmemcachedutil2 \
    libpng-dev \
    libpq-dev \
    libxml2-dev \
    rsync \
    gcc \
    g++ \
    make \
    " \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps $runtimeDeps \
    && docker-php-ext-install bcmath bz2 calendar iconv intl mbstring mcrypt mysqli opcache pdo_mysql pdo_pgsql pgsql soap zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && docker-php-ext-install exif \
    && apt-get purge -y --auto-remove $buildDeps 

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && ln -s $(composer config --global home) /root/composer
ENV PATH $PATH:/root/composer/vendor/bin

# Install nodejs.
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install --yes nodejs

# Install yarn.
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

# Clean up
RUN rm -r /var/lib/apt/lists/* 

EXPOSE 80