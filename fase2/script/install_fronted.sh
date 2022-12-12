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

#Copiamos el archivo de configuración 000-default.conf
cp ../conf/000-default.conf /etc/apache2/sites-available

#Copiamos el archivo de configuración dir.conf
cp ../conf/dir.conf /etc/apache2/mods-available

#Habilitamos el modulo rewrite
a2enmod rewrite

#Reiniciamos el servidor
systemctl restart apache2