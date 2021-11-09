#!/bin/bash -   
#Títol         :exercici4.sh
#Descripció    :cositas
#Autor          :Àlex Sánchez Blabia
#data           :       
#Versió        :0.1    
#Ús            :./exercici4.sh
#Notes          :       
#Versió_Bash   :5.0.17(1)-release
#

cd /home/users/inf/jism1/ism40567750/Scripts
avui=$(date +%F)
echo "Dona'm l'extensió del fitxer"
	read ext
echo "Dona'm el prefix de l'arxiu"
	read pre
for NAME in *.$ext
do
	if [ -z $pre ]; then
	mv $NAME ${avui}-${NAME}
	else
	mv $NAME $pre-${NAME}
fi
done
