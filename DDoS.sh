
#!/bin/bash

## Descripcion:
## Script que permite detectar ataques de tipos DDOS (Denegacion de Servicios Distribuidos).
## Fecha de Creacion: 12/01/2016
## Autor: Ricardo Rosero - RR Soluciones IT SAS
## Email: rrosero@rrsolucionesit.com
## Licencia : GPL v2

echo “Listado de direcciones IP conectadas al servidor:”
netstat -p -n | grep SYN_REC | awk '{print $5}' | awk -F: '{print $1}'

echo “Calculando y contando el numero de conexiones al servidor de cada direccion IP:”
netstat -tun | awk '{print $5}' | cut -d: -f 1 | sort | uniq -c | sort -n

echo “Cantidad de direcciones IP que se conectan al servidor en el protocolo TCP / UDP:”
netstat -anp | grep 'tcp|udp' | awk '{print $5}' | cut -d: -f 1 | sort | uniq -c

echo “Conexiones ESTABLECIDAS de cada direccion IP:”
netstat -tun | grep ESTAB | awk '{print $5}' | cut -d: -f 1 | sort | uniq -c | sort -nr

echo “Direcciones IP y su numero de conexiones al Puerto del servidor web 80:”
netstat -plan | grep :80 | awk '{print $5}' | cut -d: -f 1 | sort | uniq -c | sort -nk 1

echo “Direcciones IP y su numero de conexiones al Puerto del servidor web 443:”
netstat -plan | grep :443 | awk '{print $5}' | cut -d: -f 1 | sort | uniq -c | sort -nk 1
