#!/bin/sh

apt-get update
apt-get install -y mariadb-server

service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\
DROP USER IF EXISTS '$MYSQL_USER'@'%';\
CREATE USER "$MYSQL_USER"@"%" IDENTIFIED BY '$MYSQL_PASSWORD';\
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';\
FLUSH PRIVILEGES;"
mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"