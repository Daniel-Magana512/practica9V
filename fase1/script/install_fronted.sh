#!/bin/bash
set -x
# Actualizamos los repositorios
apt-get update

#actualizamos los paquetes
#apt-get upgrade -y

#Instalamos el servidor apache
apt-get install apache2 -y

# Instalamos los modulos php

apt-get install php libapache2-mod-php php-mysql -y

# copiamos el archivo de phpinfo de PHP
cp ../php/info.php /var/www/html

#BOrramos el archivo de index.html que está en el directorio /var/www/html
rm -f /var/www/html/index.html