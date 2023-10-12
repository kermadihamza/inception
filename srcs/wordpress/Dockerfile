FROM debian:buster

RUN apt-get -y update

RUN apt-get -y install php7.3-fpm \
    php7.3-mysql \
    wget

# download wp-cli on debian
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/

# solving 502 bad gateway error, by editing the config www.conf file
RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.3/fpm/pool.d/www.conf

# The EXPOSE instruction informs Docker that the wordpress container listens on port 9000
EXPOSE 9000

# workdir is the directory where the container will run
WORKDIR /var/www/html

COPY wp_script.sh /tmp/

RUN chmod +x /tmp/wp_script.sh

# we only need to launch php-fpm in our container, the other exec are called by other programs
# after the launch of the container
CMD ["/tmp/wp_script.sh"]