FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y mariadb-server vim 

COPY ./50-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./createdb.sql .

RUN service mysql start &&\
	mysql < createdb.sql &&\
	rm -f createdb.sql

CMD ["mysqld", "--user=mysql"]

EXPOSE 3306
