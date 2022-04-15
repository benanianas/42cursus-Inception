FROM debian:buster


RUN apt-get update && apt-get install -y nginx \
    php-cgi php-common php-fpm php-pear php-mbstring \
    php-zip php-net-socket php-gd php-xml-util \
    php-gettext php-mysql php-bcmath unzip wget git
RUN sed -i 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.3/fpm/php.ini
RUN sed -i 's/memory_limit = 128M/memory_limit = 256M/g' /etc/php/7.3/fpm/php.ini
RUN sed -i 's/max_execution_time = 30/max_execution_time = 300/g' /etc/php/7.3/fpm/php.ini
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 32M/g' /etc/php/7.3/fpm/php.ini
RUN sed -i 's/;date.timezone =/date.timezone = \"Africa\/Casablanca\"/g' /etc/php/7.3/fpm/php.ini
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz > /dev/null 2>&1
RUN tar -xvzf /tmp/wordpress.tar.gz -C /var/www/html
RUN cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
RUN sed -i 's/database_name_here/wpdb/g' /var/www/html/wordpress/wp-config.php
RUN sed -i 's/username_here/wpuser/g' /var/www/html/wordpress/wp-config.php
RUN sed -i 's/password_here/dbpassword/g' /var/www/html/wordpress/wp-config.php
RUN sed -i 's/localhost/mariadb/g' /var/www/html/wordpress/wp-config.php
RUN chown -R www-data:www-data /var/www/html/wordpress
RUN mkdir /run/php/

CMD [ "php-fpm7.3", "--nodaemonize" ]
