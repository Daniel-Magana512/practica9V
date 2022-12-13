#!/bin/bash

set -x

#Actualizamos los repositorios
apt-update

# Instalamos el cliente nfs
apt install nfs-common -y

#Montamos NFS SERVER en la máquina cliente
mount $NFS_SERVER_IP_PRIVATE

#Editamos el archivo /etc/fstab para que al iniciar la máquina se monte automáticamente el directorio compartido por NFS.
cd /etc/
echo "$NFS_SERVER_IP_PRIVATE_INSERTAR" >> fstab
