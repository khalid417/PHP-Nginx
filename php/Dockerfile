FROM php:fpm-alpine
RUN docker-php-ext-install opcache
RUN set -ex && apk --no-cache add postgresql-libs postgresql-dev \
    && docker-php-ext-install pgsql pdo_pgsql && docker-php-ext-enable pdo_pgsql \
    && apk del postgresql-dev
ENV DOCKERVERSION=24.0.2
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz