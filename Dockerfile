FROM php:8.2-apache

# Install dependencies and mysqli extension
RUN apt-get update && apt-get install -y \
    git unzip \
    && docker-php-ext-install pdo_mysql mysqli

# Copy application files to the container
COPY . /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Expose port 8080
EXPOSE 8080

# Start Apache
CMD ["apache2-foreground"]
