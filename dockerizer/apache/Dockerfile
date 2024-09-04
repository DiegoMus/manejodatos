FROM php:8.3.7-apache

COPY . /var/www/html
WORKDIR /var/www/html

RUN docker-php-ext-install mysqli

EXPOSE 80
CMD ["apache2-foreground"]