# Use PHP 8.1 FPM as the base image
FROM php:8.1-fpm

# Install necessary dependencies and extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    git \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql

# Set working directory
WORKDIR /var/www

# Copy files into the container
COPY . /var/www

# Install Composer (PHP dependency manager)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
