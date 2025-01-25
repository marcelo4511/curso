FROM php:7.4-fpm

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd sockets

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Install redis
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis


# Instalar Node.js e npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs

# Set npm cache and prefix for permissions
RUN npm config set prefix /home/$user/.npm-global

# Configurar cache do npm
RUN npm config set cache /var/www/.npm-cache --global \
    && mkdir -p /var/www/.npm-cache && chmod -R 777 /var/www/.npm-cache

# Verificar as versões do Node.js e npm
RUN node -v
RUN npm -v

COPY package.json package-lock.json /var/www/
USER root
RUN npm install
# Copiar os arquivos do frontend
COPY . /var/www/

# Set working directory
WORKDIR /var/www

USER $user