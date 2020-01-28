#!/bin/bash
echo "Bonjour !"
service mysql start
mysql -uroot <<MYSQL_SCRIPT 
    	CREATE DATABASE wp_db; 
    	GRANT ALL PRIVILEGES ON wp_db.* TO 'wp_user'@'localhost' identified by 'password';
    	FLUSH PRIVILEGES; 
MYSQL_SCRIPT
service php7.3-fpm start
service nginx start
/bin/bash
