#!/bin/bash -   
#Títol         :exercici1.sh
#Descripció    :Escriu un script que ens dongui informació sobre la caducitat i validesa dels usuaris del Sistema.
#Autor          :Àlex Sánchez Blabia      
#data           :       
#Versió        :- 0.1  
#Ús            :./exercici1.sh
#Notes          :       
#Versió_Bash   :5.0.17(1)-release
#

#sudo cat /etc/passwd

if [ $? == 0 ]; then
	echo "Ordre realitzada correctament"
	exit 0
else
	echo "Ordre invàlida"
	exit 1
fi

