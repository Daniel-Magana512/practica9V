#!/bin/bash

set -x

#Actualizamos los repositorios
apt-update

# Instalamos el cliente nfs
apt install nfs-common -y

#Montamos NFS SERVER en la máquina cliente
mount $NFS_SERVER_IP_PRIVATE:/var/www/html /var/www/html