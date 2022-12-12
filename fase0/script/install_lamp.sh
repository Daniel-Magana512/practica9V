#!/bin/bash

# Para ir depurando la información
set -x

# Actualizamos los repositorios
apt-get update

#Actualizamos los paquetes
#apt-get upgrade -y

#Instalamos el vervidor apache
apt-get install apache2 -y

#Instalamos el sistema de gestos bd
apt-get install mysql-server -y

# Instalamos los módulos de PHP
apt-get install php libapache2-mod-php php-mysql -y

#Copiamos el archivo de configuración 000-default.conf
cp ./conf/000-default.conf /etc/apache2/sites-available

#Copiamos el archivo de configuración dir.conf
cp ./conf/dir.conf /etc/apache2/mods-available

#Habilitamos el modulo rewrite
a2enmod rewrite

#Reiniciamos el servidor
systemctl restart apache2