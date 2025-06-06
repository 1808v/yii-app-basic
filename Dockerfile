FROM php:8.1-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    unzip git libicu-dev libzip-dev libonig-dev \
    && docker-php-ext-install intl pdo pdo_mysql zip mbstring && \
    a2enmod rewrite

# Copy only Yii2 app files into web root
COPY . /var/www/html/
WORKDIR /var/www/html/

# Set ownership
RUN chown -R www-data:www-data /var/www/html/

EXPOSE 80


