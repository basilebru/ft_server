FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	nginx \
	default-mysql-server \
	wget \
	vim \
	#PHP
	php \
	php-fpm \
	php-pear \
	php-cgi \
	php-json \
	php-common \
	php-zip \
	php-mbstring \
	php-net-socket \
	php-gd \
	php-xml \
	php-xml-util \
	php-mysql \
	php-gettext \
	php-bcmath

COPY srcs/index /var/www/html
RUN	chown www-data:www-data /var/www/html/wordpress

COPY srcs/default /etc/nginx/sites-available

COPY srcs/nginx-selfsigned.key /etc/ssl/private
COPY srcs/nginx-selfsigned.crt /etc/ssl/certs

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh", "-g", "daemon off;"]
