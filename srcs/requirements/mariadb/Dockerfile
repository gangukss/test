FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y mariadb-server vim 

#COPY ./50-server.cnf /etc/my.cnf.d/mariadb-server.cnf
#COPY ./createdb.sql .
COPY ./entry.sh .

RUN service mysql start 
RUN chmod 777 entry.sh
RUN ./entry.sh

CMD ["mysqld", "--user=mysql"]

EXPOSE 3306
