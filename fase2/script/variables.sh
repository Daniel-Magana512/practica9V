#Aquí ponemos la ip privada de back-end para hacerlo referenciar en el frontend
DB_HOST_PRIVATE_IP=172.31.79.23

# Variables de la base de datos
DB_NAME=db_name
DB_USER=db_user
DB_PASS=db_pass

#Para añadir las rutas de las paginas , la primera es para el cliente y la otra es para el administrador
WP_HOME=https://pra9asiriawdmp.ddns.net
WP_SITEURL=https://pra9asiriawdmp.ddns.net/wordpress

# Para el cerbot
EMAIL=chema51226@gmail.com
DOMAIN=pra9asiriawdmp.ddns.net

# Aquí ponemos la ip privada del servidor nfs
NFS_SERVER_IP_PRIVATE= 172.31.64.127:/var/www/html /var/www/html

NFS_SERVER_IP_PRIVATE_INSERTAR= 172.31.64.127:/var/www/html /var/www/html nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 

# Aquí ponemos las Ip de los frontend
IP_HTTP_SERVER_1 = 3.235.223.56

IP_HTTP_SERVER_2 = 44.197.235.29

#Para añadir la directiva de https
_SERVER= pra9asiriawdmp.ddns.net
