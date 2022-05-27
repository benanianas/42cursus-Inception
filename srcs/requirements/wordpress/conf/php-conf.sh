#!/bin/bash

#  php.ini Settings
sed -i 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.3/fpm/php.ini
sed -i 's/memory_limit = 128M/memory_limit = 256M/g' /etc/php/7.3/fpm/php.ini
sed -i 's/max_execution_time = 30/max_execution_time = 300/g' /etc/php/7.3/fpm/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 32M/g' /etc/php/7.3/fpm/php.ini
sed -i 's/;date.timezone =/date.timezone = \"Africa\/Casablanca\"/g' /etc/php/7.3/fpm/php.ini

# Change the address on which to accept FastCGI requests
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# Database settings
sed -i "s/database_name_here/$DB_NAME/g" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/$DB_USER/g" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/g" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/mariadb/g" /var/www/html/wordpress/wp-config.php
e
php-fpm7.3 --nodaemonize

