sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
chmod -R 775 /var/www/html/wordpress;
chown -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/wordpress
wp core download --allow-root;

cp wp-config-sample.php wp-config.php
sed -i -e "s/localhost/mariadb/g" wp-config.php
sed -i -e "s/database_name_here/${DB_NAME}/g" wp-config.php
sed -i -e "s/username_here/${DB_USER}/g" wp-config.php
sed -i -e "s/password_here/${DB_PASSWORD}/g" wp-config.php

wp core install --allow-root --url=${DOMAIN_NAME} --title=${DB_NAME} --admin_user=${DB_USER} --admin_password=${DB_PASSWORD} --admin_email=${DB_USER_EMAIL};
wp user create ${WORDPRESS_USER} ${WORDPRESS_EMAIL} --user_pass=${WORDPRESS_PASSWORD} --role=author --allow-root

/usr/sbin/php-fpm7.3 -F