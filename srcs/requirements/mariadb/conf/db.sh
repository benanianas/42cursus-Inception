#!/bin/bash

service mysql start
mysql -u root -e "CREATE DATABASE $DB_NAME" > /dev/null 2>&1
mysql -u root -e "CREATE USER '$MYSQL_USER'@'10.12.69.2' IDENTIFIED by '$MYSQL_PASSWORD'" > /dev/null 2>&1
mysql -u root -e "GRANT ALL PRIVILEGES ON wpdb.* TO '$MYSQL_USER'@'10.12.69.2'" > /dev/null 2>&1
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'" > /dev/null 2>&1
killall -9 mysqld
mysqld_safe

