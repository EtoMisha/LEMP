openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/selfsigned-nginx.key \
    -out /etc/ssl/certs/selfsigned-nginx.crt \
    -subj "/C=RU";
