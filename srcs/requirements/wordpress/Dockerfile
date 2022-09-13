FROM debian:buster

RUN apt update
RUN apt install -y php7.3 php-fpm php-mysqli curl sendmail

COPY conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./tools/start_wordpress.sh /var/www/html/
RUN chmod 777 /var/www/html/start_wordpress.sh

EXPOSE 9000

CMD bash /var/www/html/start_wordpress.sh
