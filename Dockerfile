# We start from the php image in version 8.1
FROM php:8.1-apache

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y openssl
RUN apt-get install -y libzip-dev
RUN apt-get install -y libpng-dev

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable mysqli
RUN docker-php-ext-install zip

# We install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# We assign permissions to the www directory
RUN chown -R www-data:www-data /var/www
RUN chmod 755 /var/www

WORKDIR /var/www/html/

RUN a2enmod rewrite