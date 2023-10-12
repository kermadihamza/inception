FROM debian:buster


RUN apt-get -y update

RUN apt-get -y install nginx \
    openssl


COPY nginx.conf /etc/nginx/conf.d/default.conf


RUN openssl req -x509 -nodes \
    -days 365 \
    -subj "/C=BE/ST=BX/L=Bruxelles/O=42/OU=42/CN=hakermad/" \
    -newkey rsa:2048 \
    -keyout /etc/ssl/hakermad.42.fr.key \
    -out /etc/ssl/hakermad.42.fr.pem
 

WORKDIR /var/www/html/

CMD ["nginx", "-g", "daemon off;"]