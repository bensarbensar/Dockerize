FROM php:7-apache

RUN apt-get update \
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev git\
  && docker-php-ext-install pdo_mysql mysqli mbstring gd iconv mcrypt
  
RUN apt-get install -y php7.0-phalcon