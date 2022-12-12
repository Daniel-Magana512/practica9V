#!/bin/bash
set -x

#Variables de configuración
#---------------------------------------------
source variables.sh

#Creación de la base de datos
#-------------------------------
#Creación de la base de datos y usuario de la bd
mysql -u root <<< "DROP DATABASE IF EXISTS $DB_NAME"
mysql -u root <<< "CREATE DATABASE $DB_NAME CHARACTER SET utf8mb4"

mysql -u root <<< "DROP USER IF EXISTS $DB_USER"
mysql -u root <<< "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'"
mysql -u root <<< "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%'"


#Reiniciamos el servicio de mysql
systemctl restart mysql