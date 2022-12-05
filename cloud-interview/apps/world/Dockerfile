FROM php:7.2-fpm-alpine

WORKDIR /world

ADD . .

RUN apk update && apk add curl && \
    curl -sS https://getcomposer.org/installer | php \
    && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN  composer update && composer install 

EXPOSE  3000

CMD ["composer", "run","dev:start"]

