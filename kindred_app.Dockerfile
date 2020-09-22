FROM php:7-fpm-alpine

LABEL author="Simon Wiles <simon.wiles@stanford.edu>"

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN apk add --no-cache git postgresql-dev && docker-php-ext-install -j$(nproc) pgsql

RUN git clone https://github.com/sul-cidr/kb-v1.git --depth 1 /var/www/html/ && rm -rf /var/www/html/.git
