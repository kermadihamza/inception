# Utilisez une image de base Debian Buster
FROM debian:buster

# Mise à jour de la liste des paquets et installation de Nginx et OpenSSL
RUN apt-get update && apt-get install -y nginx openssl

# Copiez la configuration Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Générez un certificat SSL auto-signé
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/hakermad.42.fr.key -out /etc/ssl/hakermad.42.fr.pem -subj "/C=BE/ST=BX/L=Bruxelles/O=42/OU=42/CN=hakermad/"

# Définissez le répertoire de travail
WORKDIR /var/www/html/

# Démarrez Nginx en mode démon
CMD ["nginx", "-g", "daemon off;"]
