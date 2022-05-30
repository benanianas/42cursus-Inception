#!/bin/bash

service mysql start
mysql -u root -e "CREATE DATABASE $DB_NAME" > /dev/null 2>&1
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD'" > /dev/null 2>&1
mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%'" > /dev/null 2>&1
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'" > /dev/null 2>&1
killall -9 mysqld
mysqld_safe

