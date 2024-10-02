#!/bin/bash
#Crear el archivo de texto mytext con "Hola Mundo"
echo "Creando el archivo mytext..."
echo "Hola Mundo" > mytext

#Desplegar el contenido del archivo en la terminal
echo "Mostrando el contenido de mytext..."
cat mytext

#Crear el directorio backup
echo "Creando el directorio backup"
mkdir backup

#Insertando el archivo mytext a backup
echo "Insertando el archivo mytext a backup..."
mv mytext backup/

#Listar el contenido del directorio backup
echo "Listando el contenido del directorio backup..."
ls backup

#Eliminar el archivo mytext del directorio backup
echo "Eliminando el archivo mytext de backup..."
rm backup/mytext

#Eliminar el directorio backup
echo "Eliminando el directorio backup..."
rmdir backup