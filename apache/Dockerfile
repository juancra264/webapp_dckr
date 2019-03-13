FROM php:7.0-apache
MAINTAINER juancra264 "juancra264@hotmail.com"
#COPY ./public_html/ /var/www/html
RUN echo "AddType text/html .php .html" >> /etc/apache2/conf-enabled/docker-php.conf 
RUN docker-php-ext-install mysqli
