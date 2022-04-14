FROM debian:buster

EXPOSE 3306
RUN apt-get update && apt-get install -y mariadb-server mariadb-client
COPY ./conf/db.sql /tmp/db.sql
RUN service mysql start && mysql -u root < /tmp/db.sql
CMD ["mysqld_safe"]