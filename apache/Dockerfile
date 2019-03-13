FROM php:7.0-apache
MAINTAINER juancra264 "juancra264@hotmail.com"
COPY ../public_html/ /var/www/html
RUN apk update; \
    apk upgrade;
RUN docker-php-ext-install mysqli
    #docker-php-ext-enable mysqli
#EXPOSE 80
