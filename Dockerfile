FROM php:7.0-fpm as base:php

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wait-for-it \
        apt-transport-https \
        ca-certificates \
        gnupg2 \
        zlib1g-dev \
        git \
        ghostscript \
        gpac \
        imagemagick \
        libav-tools \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libmagickwand-dev \
        libmcrypt-dev \
        libpng-dev \
        librabbitmq-dev \
        libssl-dev \
        libxslt-dev \
        libzmq3-dev \
        locales \
        mcrypt \
        swftools \
        unoconv \
        unzip \
        xpdf \
    && update-locale "LANG=fr_FR.UTF-8 UTF-8" \
    && dpkg-reconfigure --frontend noninteractive locales \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip exif iconv mbstring pcntl sockets xsl intl pdo_mysql gettext bcmath mcrypt \
    && pecl install redis amqp-1.9.3 zmq-beta imagick-beta \
    && docker-php-ext-enable redis amqp zmq imagick \
    && pecl clear-cache \
    && docker-php-source delete \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www
ENV PHRASEA_VERSION 4.0.9
RUN git clone --branch ${PHRASEA_VERSION} https://github.com/alchemy-fr/Phraseanet.git app\
    && cd app \
    && chmod -R 777 logs cache config tmp www/custom datas

FROM composer:1 as composer
COPY --from=base /var/www/app .
RUN composer install --ignore-platform-reqs

FROM node:dubnium-stretch-slim as npm
WORKDIR /app
COPY --from=composer /app .
RUN apt-get update && apt-get install -y --no-install-recommends bzip2 git \
    && echo '{ "allow_root": true }' > /root/.bowerrc \
    && npm install \
    && npm run postinstall \
    && npm run build \
    && rm -rf /var/lib/apt/lists/*

FROM base:php
COPY --from=npm /app /var/www/app
WORKDIR /var/www/app
COPY .docker/php/configuration.yml config/configuration.yml
COPY .docker/php/entrypoint.sh /usr/local/bin/phrasea-entrypoint
COPY .docker/php/phrasea-init.sh /usr/local/bin/phrasea-init
RUN chmod +x /usr/local/bin/phrasea-entrypoint \
    && chmod +x /usr/local/bin/phrasea-init \
    && chmod -R 777 logs cache config tmp www/custom datas
ENV MYSQL_HOST mysql
ENV ELASTIC_HOST elastic
ENV WAITFORIT_TIMEOUT 120
ENTRYPOINT ["phrasea-entrypoint"]
STOPSIGNAL SIGQUIT
EXPOSE 9000
CMD ["php-fpm"]