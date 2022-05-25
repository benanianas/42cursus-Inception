FROM debian:buster


RUN apt-get update && apt-get install -y \
    php-cgi php-common php-fpm php-pear php-mbstring \
    php-zip php-net-socket php-gd php-xml-util \
    php-gettext php-mysql php-bcmath unzip wget git
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz > /dev/null 2>&1
RUN mkdir -p /var/www/html
RUN tar -xzf /tmp/wordpress.tar.gz -C /var/www/html
RUN cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
COPY ./conf/php-conf.sh /
RUN chmod +x /php-conf.sh
RUN sh /php-conf.sh
RUN chown -R www-data:www-data /var/www/html/wordpress
RUN mkdir /run/php/
CMD [ "php-fpm7.3", "--nodaemonize" ]
