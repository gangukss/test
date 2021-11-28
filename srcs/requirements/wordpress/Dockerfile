FROM debian:buster

RUN apt-get update -y
RUN apt-get -y install php7.3 php-fpm php-cli curl php-mysqli php-mbstring php-xml mariadb-client wget vim

#COPY entrypoint.sh ./

RUN wget https://wordpress.org/wordpress-5.8.1.tar.gz -P /var/www
RUN cd /var/www && tar -xzvf wordpress-5.8.1.tar.gz && rm -f wordpress-5.8.1.tar.gz
RUN chown -R www-data:www-data /var/www/wordpress

COPY ./wp-config.php /var/www/wordpress/
COPY ./www.conf /etc/php/7.3/fpm/pool.d
RUN mkdir -p /run/php

#RUN service php7.3-fpm start

#ENTRYPOINT ["bash", "entrypoint.sh"]
CMD ["php-fpm7.3", "-F"]

EXPOSE 9000
