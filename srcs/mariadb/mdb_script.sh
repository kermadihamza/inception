#!/bin/bash
# create a database for the wordpress service to store its information  

service mysql start

# mysql_secure_installation <<EOF

# y
# secret
# secret
# y
# y
# y
# y
# EOF

# bash /tmp/mysql_secure.sh

echo "create database if not exists $MYSQL_DATABASE;"| mysql -u root
echo "create user '$MYSQL_ADMIN_USER'@'%' identified by '$MYSQL_ROOT_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN_USER'@'%';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
# echo "SHOW GRANTS FOR '$MYSQL_ADMIN_USER'@'%';" | mysql -u root

service mysql stop
# Fix 'Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock'
mysqld_safe --datadir=/var/lib/mysql