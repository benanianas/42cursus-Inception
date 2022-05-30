#!/bin/bash

# php.ini Settings
sed -i 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.3/fpm/php.ini
sed -i 's/memory_limit = 128M/memory_limit = 256M/g' /etc/php/7.3/fpm/php.ini
sed -i 's/max_execution_time = 30/max_execution_time = 300/g' /etc/php/7.3/fpm/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 32M/g' /etc/php/7.3/fpm/php.ini
sed -i 's/;date.timezone =/date.timezone = \"Africa\/Casablanca\"/g' /etc/php/7.3/fpm/php.ini

# Change the address on which to accept FastCGI requests
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# wordpress settings
# wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
# tar -xvzf /tmp/wordpress.tar.gz -C /var/www/wordpress
wp core download --path=/var/www/wordpress --version=6.0 --allow-root
wp core config --path=/var/www/wordpress --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --skip-check --allow-root --extra-php <<PHP
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
PHP
wp core install --path=/var/www/wordpress --url=abenani.42.fr --title=abenani --admin_user=benanianas --admin_password=$ADMIN_PASS --admin_email=rick@1337.ma --allow-root
wp user create anas benanianas21@gmail.com --user_pass=$USER_PASS --role=author --path=/var/www/wordpress --allow-root
wp plugin install redis-cache --version=2.0.26 --activate --path=/var/www/wordpress --allow-root
wp redis enable --path=/var/www/wordpress --allow-root
php-fpm7.3 --nodaemonize

