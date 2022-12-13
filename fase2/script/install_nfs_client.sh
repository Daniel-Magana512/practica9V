#!/bin/bash

set -x

#Actualizamos los repositorios
apt-update

# Instalamos el cliente nfs
apt install nfs-common -y

#Montamos NFS SERVER en la máquina cliente
mount $NFS_SERVER_IP_PRIVATE:/var/www/html /var/www/html

#Editamos el archivo /etc/fstab para que al iniciar la máquina se monte automáticamente el directorio compartido por NFS.
echo "$NFS_SERVER_IP_PRIVATE:/var/www/html /var/www/html  nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> -a /etc/fstab