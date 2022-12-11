#!/bin/sh
userdel mysql
#makes sure that the correct user no. owns mysql directory
useradd -u 1001 mysql
chown -R mysql:mysql /var/lib/mysql

service mysql start
mysql -u root -e "DROP DATABASE IF EXISTS $MYSQL_DATABASE"
mysql -u root -e "DROP USER IF EXISTS '$MYSQL_USER'@'%'"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION"
mysql -u root -e "FLUSH PRIVILEGES"
mysqladmin -u root password $MYSQL_ROOT_PASSWORD