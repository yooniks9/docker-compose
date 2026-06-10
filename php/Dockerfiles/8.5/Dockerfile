FROM php:8.5-apache
LABEL maintainer="Roy Tan yooniks9@gmail.com"

# Install the official trusted PHP extension installer script
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Make the helper executable and install all requested libraries flawlessly
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
    bcmath \
    bz2 \
    calendar \
    iconv \
    intl \
    mbstring \
    mysqli \
    opcache \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    soap \
    zip \
    exif \
    gd \
    ldap \
    memcached \
    redis

# Install essential system-level runtime utilities
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    git \
    && rm -r /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod rewrite headers ssl expires

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && ln -s $(composer config --global home) /root/composer
ENV PATH=$PATH:/root/composer/vendor/bin

EXPOSE 80
EXPOSE 443