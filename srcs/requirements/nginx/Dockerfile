FROM debian:buster

RUN apt update
RUN apt install -y nginx openssl

EXPOSE 443
EXPOSE 80

COPY ./conf/default /etc/nginx/sites-enabled/

COPY ./tools/ssl.sh /var/www
RUN chmod 777 /var/www/ssl.sh 
RUN /var/www/ssl.sh

CMD nginx -g 'daemon off;'