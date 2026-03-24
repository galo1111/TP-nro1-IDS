#!/bin/bash

while true; do
for archivo in ~/EPNro1/entrada/*; do
if [ -f "$archivo" ]; then
        cat "$archivo" >> ~/EPNro1/salida/$FILENAME.txt
        mv "$archivo" ~/EPNro1/procesado/
fi
done
sleep 2
done
