#installs and unarchives wp
wget https://wordpress.org/latest.tar.gz
mv latest.tar.gz /var/www/html
cd /var/www/html
tar -xvf latest.tar.gz
rm -rf latest.tar.gz

#installs wp cli
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /run/php
mkdir -p /etc/php/7.3/fpm

cd /var/www/html/wordpress
chmod 777 /usr/local/bin/wp

wp config create --dbhost=$WORDPRESS_DB_HOST \
				--dbname=$MYSQL_DATABASE \
				--dbuser=$MYSQL_USER \
				--dbpass=$MYSQL_PASSWORD \
				--allow-root

wp core install --title=$WP_TITLE \
				--admin_user=$WORDPRESS_ADMIN \
				--admin_password=$WORDPRESS_ADMIN_PSSWRD \
				--admin_email=$WORDPRESS_ADMIN_EMAIL \
				--url=$DOMAIN_NAME \
				--allow-root

wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
                --role=author \
                --user_pass=$WORDPRESS_USER_PSSWRD \
                --allow-root

chmod 777 -R /var/www/html
chown -R www-data:www-data /var/www/html

/usr/sbin/php-fpm7.3 -F -R