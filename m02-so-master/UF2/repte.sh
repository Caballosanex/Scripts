#!/bin/bash -   
#Títol         :repte.sh
#Descripció    :Realitzar un script per inserir números a un fitxer, de manera que quedi endreçat. Que els esborri. Que ens digui si el nombre que volem consultar està o no en el fitxer. I per finalitzar que es pugui visualitzar el contingut del fitxer.
#Autor          :Àlex Sánchez Blabia
#data           :       
#Versió        :0.1    
#Ús            :./repte.sh
#Notes          :       
#Versió_Bash   :5.0.17(1)-release
#

/usr/bin/clear

echo "1. Insereix números a un fitxer."
echo "2. Esborra números del fitxer."
echo "3. Quin número vols trobar en el Fitxer?."
echo "4. Visualitza el contingut del fitxer."
echo "5. Sortir"
echo " === Escull una opció de menú === "

read -p " " option

case $option in
      1)
	  read -p "Quin numero vols afegir" num
	  echo $num >> $1
	  ;;
      2)
	  read -p "Quin número vols esborrar? " num
	  inv=`egrep -v $num $1`
	  echo $inv > $1
	  ;;
      3)
	  read -p "Quin número vols trobar en el fitxer? " num
	  echo "$(cat $1 | grep $num)"
	  ;;
      4)
	  cat $1
	  ;;
      5)
	  echo "Adéu"
	  sleep 1
	  exit 0
	  ;;
  esac
