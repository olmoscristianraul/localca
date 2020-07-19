#!/bin/bash
read -p 'Ingresar nombre de la Autoridad Certificante (HCSinergiaCA): ' caFileName
read -p 'Ingresar nombre del dominio (odoo.example.com): ' CANAME
printf "\n\n (+) Generating CA Key"
#for some reason windows 10 displays password on prompt, so hiding.. 
stty -echo
openssl genrsa -des3 -out ${caFileName}.key 2048
stty echo
printf "\n\n (+) Generating Root Certificate"
stty -echo
openssl req -x509 -new -nodes -key ${caFileName}.key -sha256 -days 365 -subj "/C=AR/ST=Buenos Aires/L=La Plata/CN=${CANAME}" -out ${caFileName}.pem
stty echo
