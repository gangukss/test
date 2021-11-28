FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y mariadb-server vim 

COPY ./createdb.sh /
COPY ./start_mysql.sh /

CMD ["sh", "start_mysql.sh"]

EXPOSE 3306
