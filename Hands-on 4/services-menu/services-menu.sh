#!/bin/bash

#Funcion para mostrar el menu de opciones
show_menu(){
	echo "+-----------------------------------------------------+"
	echo "|                    Services Menu                    |"
	echo "+-----------------------------------------------------+"
	echo "| 1) Listar contenido de un directgorio               |"
	echo "| 2) Crear un archivo de texto con una linea de texto |"
	echo "| 3) Comparar dos archivos de texto                   |"
	echo "| 4) Mostrar el uso de awk                            |"
	echo "| 5) Mostrar el uso de grep                           |"
	echo "| 6) Salir                                            |"
	echo "+-----------------------------------------------------+"
}

#Funcion para listar el contenido de um directorio
list_directory(){
	echo -n "Introduce la ruta del directorio a listar: "
	read dir_path
	if [ -d "$dir_path" ]; then
		echo "Conrtenido del directorio $dir_path: "
		ls "$dir_path"
	else
		echo "La ruta $dir_path no es un directorio valido"
	fi
}

#Funcion para crear un archivo de text con una linea de texto
create_text_file(){
	echo -n "Introduce la cadena de texto a almacenar en el archivo: "
	read text
	echo -n "Introduce el nombre del archivo de texto (con extension): "
	read filename
	echo "$text" > "$filename"
	echo "Archivo $filename creado"
}

#Funcion para comparar dos archivos de texto
compare_files(){
	echo -n "Introduce la ruta del primer archivo: "
	read file1
	echo -n "Introduce la ruta del segundo archivo: "
	read file2
	if [ -f "$file1" ] && [ -f "$file2" ]; then
		echo "Comparando $filer1 con $file2: "
		diff "$file1" "$file2"
	else 
		echo "Uno o ambos archivos no existen"
	fi
}

#Funcion para mostrar el uso de awk
use_awk(){
	echo "Mostrando ejemplo de uso del comando awk..."
	echo "Contenido del archivo /etc/passwd: "
	awk -F: '{print $1 " -> " $7}' /etc/passwd
}

#Funcion para mostrar el uso de grep
use_grep(){
	echo "Mostrando ejemplo de uso del comando grep..."
	echo "Buscando 'root' en /etc/passwd: "
	grep "root" /etc/passwd
}

#Loop principal del menu
while true; do
	show_menu
	echo -n "Elige una opcion (1-6): "
	read option
	case $option in
		1)
			list_directory
			;;
		2)
			create_text_file
			;;
		3)
			compare_files
			;;
		4) 
			use_awk
			;;
		5)
			use_grep
			;;
		6)
			echo "Saliendo..."
			exit 0
			;;
		*)
			echo "Opcion invalida"
			;;
	esac
done