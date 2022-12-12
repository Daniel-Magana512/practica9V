#!/bin/bash
set -x

# Variables de configuración
source variables.sh
#---------------------------------

# Accedemos al directorio temporal /tmp
cd /tmp

#Eliminamos el directorio de instalaciones previas
rm -rf iaw-practica-lamp

#Clonamos el repositorio

git clone https://github.com/josejuansanchez/iaw-practica-lamp.git

#Movemos el código fuente de la aplicación
mv /tmp/iaw-practica-lamp/src/* /var/www/html

#Modificamos el propietario y el grupo de los archivos
chown www-data:www-data /var/www/html -R

#Borramos el archivo index.html , para que lo primero que me coja sea el index.php
rm /var/www/html/index.html

#Configuramos las variables de conexión gbd
sed -i "s/localhost/$DB_HOST_PRIVATE_IP/" /var/www/html/config.php
sed -i "s/lamp_db/$DB_NAME/" /var/www/html/config.php
sed -i "s/lamp_user/$DB_USER/" /var/www/html/config.php
sed -i "s/lamp_password/$DB_PASS/" /var/www/html/config.php


# Apuntes mysql -u lamp_user -p -h 172.31.80.53