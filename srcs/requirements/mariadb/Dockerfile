FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server

COPY conf/my.cnf /etc/mysql/
COPY ./tools /var/www/

EXPOSE 3306

RUN service mysql start && mysql < /var/www/createdb.sql
RUN service mysql stop;

CMD mysqld_safe