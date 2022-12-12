#!/bin/bash
apt-update

#Añadimos las variables de conf
NFS_SERVER_IP_PRIVATE = 172.31.75.236 
# Instalamos el cliente nfs
apt install nfs-common -y

#Montamos NFS SERVER en la máquina cliente
sudo mount $NFS_SERVER_IP_PRIVATE:/var/www/html /var/www/html