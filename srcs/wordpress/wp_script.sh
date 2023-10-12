#!/bin/bash

if [ -f ./wp-config.php ]
then
    echo "wordpress is already installed"
else
wp core download --allow-root
cp wp-config-sample.php wp-config.php
sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$MYSQL_DATABASE' );/g" /var/www/html/wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_ADMIN_USER' );/g" /var/www/html/wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_ROOT_PASSWORD' );/g" /var/www/html/wp-config.php
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', '$WP_DB_HOST' );/g" /var/www/html/wp-config.php
sed -i "s/define( 'WP_DEBUG', false );/define( 'WP_DEBUG', true );/g" /var/www/html/wp-config.php
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$MYSQL_ADMIN_USER --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root
wp user create $WP_REGULAR_USER $WP_REGULAR_USER_MAIL --user_pass=$WP_REGULAR_PASSWORD --allow-root
fi
/usr/sbin/php-fpm7.3 --nodaemonize