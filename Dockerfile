FROM php:8.2-apache

# Install necessary extensions and tools
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libonig-dev \
    libpng-dev && \
    docker-php-ext-install pdo_mysql mysqli

# Copy application files
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

# Expose the port
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]