FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-cgi php-common php-fpm php-pear php-mbstring \
    php-zip php-net-socket php-gd php-xml-util \
    php-gettext php-mysql php-bcmath unzip wget git
RUN mkdir -p /var/www/wordpress
RUN wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /tmp/wp-cli.phar
RUN chmod +x /tmp/wp-cli.phar
RUN mv /tmp/wp-cli.phar /usr/local/bin/wp
COPY ./tools/php-conf.sh /
RUN chmod +x /php-conf.sh
RUN mkdir /run/php/
ENTRYPOINT [ "/php-conf.sh" ]