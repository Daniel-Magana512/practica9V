#!/bin/bash
set -x

source variables.sh

#Descargammos la herramienta de wordpress
wget https://es.wordpress.org/latest-es_ES.zip -O /tmp/latest-es_ES.zip

#Instalamos la utilidad unzip
apt install unzip -y

# ELiminamos las instalaciones previas de wordpress
rm -rf /var/html/wordpress

#Descomprimimos el archivo en var/www/html

unzip /tmp/latest-es_ES.zip -d /var/www/html

# COpiamos el archvio de configuración de ejemplo y creamos uno
cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

# configuramos las variables en el archivo de configuración

sed -i "s/database_name_here/$DB_NAME/" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/$DB_USER/" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$DB_PASS/" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/$DB_HOST_PRIVATE_IP/" /var/www/html/wordpress/wp-config.php

# Añadimos las variables WP_HOME y la WP_SITEURL
sed -i "/DB_COLLATE/a define('WP_HOME', '$WP_HOME');" /var/www/html/wordpress/wp-config.php
sed -i "/WP_HOME/a define('WP_SITEURL', '$WP_SITEURL');" /var/www/html/wordpress/wp-config.php


# Copiamos el archivo index.php del directorio wordpress

cp /var/www/html/wordpress/index.php /var/www/html/index.php

#Configuramos el archivo index.php
sed -i "s#wp-blog-header.php#wordpress/wp-blog-header.php#" /var/www/html/index.php


#MOdificamos el propietario y el grupo

chown www-data:www-data /var/www/html -R

#Reiniciamos el servidor
systemctl restart apache2