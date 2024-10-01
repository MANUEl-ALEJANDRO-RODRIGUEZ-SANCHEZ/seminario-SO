@echo off
REM Crear el archivo de texto mytext.txt con "Hola Mundo"
echo Hola Mundo > mytext.txt

REM Desplegar el contenido del archivo en la terminal
echo Mostrando el contenido de mytext.txt:
type mytext.txt

REM Crear el subdirectorio backup
echo Creando el subdirectorio backup...
mkdir backup

REM Copiar mytext.txt al subdirectorio backup
echo Copiando mytext.txt a backup...
copy mytext.txt backup\

REM Listar el contenido del subdirectorio backup
echo Listando el contenido del subdirectorio backup:
dir backup

REM Eliminar el archivo mytext.txt de backup
echo Eliminando el archivo mytext.txt de backup...
del backup\mytext.txt

REM Eliminar el subdirectorio backup
echo Eliminando el subdirectorio backup...
rmdir backup
