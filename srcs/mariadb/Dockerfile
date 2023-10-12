FROM debian:buster

RUN apt-get -y update

RUN apt-get install mariadb-server \
                    mariadb-client -y

# need to copy the script into the container otherwise can't execute it from the container
COPY mysql_secure.sh /tmp/
COPY mdb_script.sh /tmp/
COPY my.cnf /etc/mysql/my.cnf

RUN chmod u+x /tmp/mdb_script.sh

# Databse connection error probably linked to the mariadb config file which should be modified
EXPOSE 3306

CMD ["/tmp/mdb_script.sh", "-F"]
