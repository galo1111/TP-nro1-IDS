#!/bin/bash


export FILENAME="salida"

if [[ "$1" == "-d" ]]; then
echo "Parametro -d detectado"
pkill -f "consolidar.sh"
rm -r ~/EPNro1
exit 0
fi

while true;
do
echo "-------Menú principal-------"
echo -e "opcion 1) Crear entorno\n"
echo -e "opcion 2) Correr proceso\n"
echo -e "opcion 3) Mostrar el listado de alumnos\n"
echo -e "opcion 4) Mostrar las 10 notas mas altas\n"
echo -e "opcion 5) Indique un numero de padron\n"
echo -e "opcion 6) Salir"
read opcion


case $opcion in
    1)
        mkdir -p ~/EPNro1
        mkdir -p ~/EPNro1/entrada
        mkdir -p ~/EPNro1/procesado
        mkdir -p ~/EPNro1/salida
        cp consolidar.sh ~/EPNro1/
        echo "Entorno creado.";;

    2) bash ~/EPNro1/consolidar.sh &
echo "Corriendo proceso.";;

    3) 
if [ -f ~/EPNro1/salida/$FILENAME.txt ]; then 
        sort -n ~/EPNro1/salida/$FILENAME.txt
else
echo "No existe el archivo en la carpeta salida"
fi;;

    4) 
if [ -f ~/EPNro1/salida/$FILENAME.txt ]; then 
        sort -nr -k5 ~/EPNro1/salida/$FILENAME.txt | head -n 10
else
echo "No existe el archivo en la carpeta salida"
fi;;

    5) echo "Ingrese un padron: "
read padron
if [ -f ~/EPNro1/salida/$FILENAME.txt ]; then 
        grep "$padron" ~/EPNro1/salida/$FILENAME.txt
else
echo "No existe el archivo en la carpeta salida"
fi;;
    6) echo "Cerrando menu..."
exit 0;;

    *) echo "Opcion invalida. Intente de nuevo.";;
esac
done
