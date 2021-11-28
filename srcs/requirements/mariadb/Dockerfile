FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y mariadb-server vim 

#COPY ./50-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./createdb.sql .

RUN service mysql start &&\
	mysql -u root -p"$ROOT_PASS"<<-EOSQL \
		CREATE DATABASE $DB_NAME; \
		CREATE USER "$DB_USER"@"%" IDENTIFIED BY "$DB_PASS"; \
		GRANT ALL PRIVILEGES ON $DB_NAME.* TO "$DB_USER"@"%"; \
		FLUSH PRIVILEGES; \
		SET PASSWORD FOR 'root'@'localhost' = PASSWORD("$ROOT_PASS"); \
	EOSQL

CMD ["mysqld", "--user=mysql"]

EXPOSE 3306
