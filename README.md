# **Práctica 9 INSTALACIÓN DE WORDPRESS EN DISTINTOS NIVELES**

En está practica vamos a instalar wordpress en diferentes niveles:

* **Fase 0** 

*Instalaremos el wordprees con solamente un nodo.*

* **Fase 1** 

*En esta fase, usaremos dos máquinas que tendrán dos niveles distintos una es el front-end(que tendrá wordpress y apache) y el back-end(que le servirá la base de datos al front-end).*

* **Fase 2** 

**La siguiente fase constará de 5 máquinas:**

*La primera capa, pondremos un balanceador que nos permitirá comunicar con lás máquinas que hay en las capas inferiores)*   

*La segunda capa, tiene 3 niveles font-end (dos que servirán como servidor apache, y un servidor nfs que contestará a las peticiones que les realice apache, es decir, está maquina tendrá wordpress, entonces cada vez que alguien se quiera conectar al wordpress el servidor de apache preguntará al servidor nfs para que esa respuesta llegue finalmente al balanceador).*

*La tercera capa es el back-end , la máquina que está en este nivel nos dará la base de datos y con un usuario para wordpress.*



![](./fotos/foto1.PNG)

## **FASE 0**

Instalaremos todo lo necesario para tener en una única máquina wordpress.

**Nos vamos al archivo de las variables.**

```yml
---
DB_HOST_PRIVATE_IP: localhost
DB_NAME: db_name
DB_USER: db_user
DB_PASS: db_pass

WP_HOME: https://prac9dmpasir.ddns.net
WP_SITEURL: https://prac9dmpasir.ddns.net/wordpress

EMAIL: chema51226@gmail.com
DOMAIN: prac9dmpasir.ddns.net


php_paquetes:
  - php
  - libapache2-mod-php 
  - php-mysql
```

La primera primera variables hay que poner la ip privada de la máquina que tenga la base de datos (back-end).

DB_NAME, DB_USER, DB_PASS son variables para la base de datos , donde diremos la base de datos, usuario y contrasseña.

WP_HOME es la url que utilizan los clientes.
WP_SITEURL es la url que utilizarán los administradores para configurar y demás wordpress.

EMAIL (CORREO) y DOMAIN (DOMINIO) son las variables para obtener el certificado.

La última variable es php_paquetes tiene una lista de contenido para que nos descargue a la vez los paquetes.


**Nos vamos a la pila lamp.**
```yml
---
- name: Playbook para instalar la pila lamp
  hosts: front
  become: yes

  tasks:

  - name: Añadimos las variables
    ansible.builtin.include_vars:
      ./variables.yml

  - name: Actualizar los repositorios
    apt:
      update_cache: yes

  - name: Instalar el servidor web Apache
    apt:
      name: apache2
      state: present

  - name: Instalar el servidor mysql
    apt:
      name: mysql-server
      state: present

  - name: Instalar PHP 
    apt:
      name: "{{php_paquetes}}"
      state: present

#-------------------------------------------------------------------

  - name: Eliminamos los archivos clonados innecesarios.
    file:
      path: /etc/apache2/sites-available/000-default.conf


  - name: Clonamos el repositorio
    git:
      repo: https://github.com/Daniel-Magana512/practica9V.git
      dest: /tmp/archivos

  - name: Movemos los archivos de configuración a /etc/apache2/sites-availeble
    copy:
      src: /tmp/archivos/fase0/conf/000-default.conf
      dest: /etc/apache2/sites-available/
      remote_src: yes

  - name: Movemos el dir.conf
    copy:
      src: /tmp/archivos/fase0/conf/dir.conf
      dest: /etc/apache2/mods-available
      remote_src: yes


  - name: Eliminamos los archivos clonados innecesarios.
    file:
      path: /tmp/archivos

#--------------------------------------------------------------

  - name: Instalamos el módulo rewrite
    apache2_module:
        name: rewrite
        state: present

  - name: Reiniciamos el servidor apache
    service:
      name: apache2
      state: restarted 
´´´


