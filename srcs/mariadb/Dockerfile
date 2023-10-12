# Utilisez une image de base Debian Buster
FROM debian:buster

# Mise à jour de la liste des paquets
RUN apt-get update -y

# Installation de MariaDB Server et Client
RUN apt-get install -y mariadb-server mariadb-client

# Copiez les scripts et fichiers de configuration dans le conteneur
COPY mysql_secure.sh /tmp/
COPY mdb_script.sh /tmp/
COPY my.cnf /etc/mysql/my.cnf

# Donnez la permission d'exécuter au script mdb_script.sh
RUN chmod +x /tmp/mdb_script.sh

# Exposez le port 3306 pour les connexions à MariaDB
EXPOSE 3306

# Démarrez MariaDB en exécutant le script mdb_script.sh
CMD ["/tmp/mdb_script.sh", "-F"]
