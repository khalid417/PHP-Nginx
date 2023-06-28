FROM php:fpm-alpine
RUN docker-php-ext-install opcache
RUN set -ex && apk --no-cache add postgresql-libs postgresql-dev \
    && docker-php-ext-install pgsql pdo_pgsql && docker-php-ext-enable pdo_pgsql \
    && apk del postgresql-dev
RUN apk add docker