FROM php:fpm-alpine
RUN docker-php-ext-install opcache
RUN set -ex && apk --no-cache add postgresql-libs postgresql-dev \
    && docker-php-ext-install pgsql pdo_pgsql && docker-php-ext-enable pdo_pgsql \
    && apk del postgresql-dev
COPY php/production/opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY ./data/ /var/www/html/