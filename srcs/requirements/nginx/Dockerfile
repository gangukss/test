FROM debian:buster

RUN apt-get update -y 
RUN apt-get install -y nginx openssl vim

RUN openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN=kankim.42.fr" \
    -keyout /etc/ssl/private/kankim.42.fr.key -out /etc/ssl/certs/kankim.42.fr.crt

COPY ./default /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443
