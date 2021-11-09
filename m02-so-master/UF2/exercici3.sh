#!/bin/bash -   
#Títol         :exercici3.sh
#Descripció    :Modifiqueu l'exercici2, per que mostri el nombre de fitxers donat el directori /var       
#Autor          :Àlex Sánchez Blabia
#data           :       
#Versió        :0.1    
#Ús            :./exercici3.sh
#Notes          :       
#Versió_Bash   :5.0.17(1)-release
#

echo "El directori /var/ té $(ls -l /var/ | wc -l) fitxers"
