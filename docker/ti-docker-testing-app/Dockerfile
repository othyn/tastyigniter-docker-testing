FROM php:8.0.3-fpm-alpine AS php

# Update package manager ready for deps to be installed
RUN apk update

# Install required deps
RUN apk add --update --no-cache \
    curl \
    zip \
    libzip-dev \
    git \
    icu-dev \
    jpeg-dev \
    freetype \
    freetype-dev \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev

# Install PHP extensions and cleanup
RUN docker-php-ext-install intl zip opcache pdo pdo_mysql mysqli exif pcntl bcmath \
    && docker-php-ext-enable intl opcache

# Configure PHP extensions and cleanup
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && apk del freetype-dev libpng-dev libjpeg-turbo-dev

# Pull in the opcache config
COPY ./docker/ti-docker-testing-app/opcache.ini /usr/bin/etc/php/conf.d/docker-php-ext-opcache.ini

# Grab Composer bin from image - the cheats installation
COPY --from=composer:2.0.8 /usr/bin/composer /usr/bin/composer

# Setup non-root user & group
RUN addgroup -S www-user \
    && adduser \
    --disabled-password \
    --gecos "" \
    --home /home/www-user \
    --uid 1000 \
    --ingroup www-data \
    www-user

# Create the Composer cache directory
RUN mkdir --parents /home/www-user/.composer \
    && chown -R www-user:www-user /home/www-user

# Ensure the non-root user has ownership of working directory
RUN chown -R www-user:www-user /var/www

# Set working directory
WORKDIR /var/www

# Ensure active user is not root
USER www-user
