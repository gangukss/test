FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y mariadb-server vim 

COPY ./createdb.sql /
COPY ./start_mysql.sh /

CMD ["sh", "start_mysql.sh"]

EXPOSE 3306
