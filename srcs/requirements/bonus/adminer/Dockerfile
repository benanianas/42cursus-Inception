FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-cgi php-common php-fpm php-pear php-mbstring \
    php-zip php-net-socket php-gd php-xml-util \
    php-gettext php-mysql php-bcmath unzip wget git
RUN mkdir -p /var/www/adminer
RUN wget -q http://www.adminer.org/latest.php -O /var/www/adminer/index.php
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 7000/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir /run/php/
CMD [ "php-fpm7.3", "--nodaemonize" ]