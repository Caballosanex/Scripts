## Autor:          PE2_UF2_1JISM_Sànchez_Blabia.md
## Date:           13/04/21
## Description:    Prova M02 - UF02 Linux 1  
#### 1. Descarrega't el fitxer markdown annexat a la tasca.
#### 2. Renombra el fitxer amb el següent format: PE2_UF2_Grup_Cognom_alumne.md
#### 3. Puja el fitxer al GitLab
#### 4. Fes els exercicis fent servir scripts i Linux.
#### 5. Enganxa la solució al fitxer markdown. No cal que incloguis la capçalera.
#### 6. Al acabar la prova, recorda annexar el markdown a la tasca i fer un commit de tots els canvis.
--------

1. **( 1 punt ) Copia aquest fitxer en el teu repositori remot ( GitLab, GitHub ), a la carpeta /m-02/uf2/prova-escrita/**   

  **Escriu aquí el link.**    
    https://gitlab.com/alexsanchezblabia/m02-so/-/blob/master/UF2/prova-escrita/PE2_UF2-1JISM_Sanchez_Alex.md
2. **(1 punt ) Escriu un script que ens dongui informació sobre la caducitat i validesa dels usuaris del Sistema.**   

-------------------------------------------

```bash
  1 #! bin/bash
  2 
  3 i=$(who -a)
  4 echo "L'informació de caducitat i validesa dels usuaris del sistema és: $i"
  5 
  6 if [ $? = 0 ]; then
  7         echo "Realitzat Correctament"
  8         exit 0
  9 else
 10         echo "Comanda Fallida"
 11         exit 1
 12 fi
```

**Si l'ordre retorna un estat de sortida 0, informeu que "l'ordre s'ha realitzat correctament" i sortiu amb un estat de sortida 0.**   
**Si l'ordre retorna un estat de sortida diferent de zero, informeu "Comanda fallida" i sortiu amb un estat de sortida 1.**  

3. **( 1 punt ) Quin cron farem servir per tal que l'script anterior es faci a les 23:45 cada diumenge?**  

   - 45 23 * * SUN 

     (He posat SUN, perquè es universal i totes les versions de cron ho entendran)

4. **(1 punt ) Feu un script que comprovi si existeix el fitxer "/tmp/prova". Si no existeix el crea. Feu que informi a l'usuari del que ha passat.**

```bash
  1 #! /bin/bash 
  2 if [ -f /tmp/prova ]; then
  3         echo “Existeix el fitxer /tmp/prova
  4 else    
  5         touch /tmp/prova
  6         echo “He creat el fitxer /tmp/prova”
  7 fi
```




5. **(1 punt ) Que estem fent en la següent comanda? grep -w 8 fitxer**

És una ordre que s'utilitza per filtrar valors, cadenes o text d'un fitxer. En aquest cas l'estem utilitzant juntament a la variant "-w".

En aquest cas la variant "-w", fa que el `grep` només filtri caràcters concrets. En aquest cas, està filtrant únicament els caràcters "8" de "fitxer".

6. **(1 punt ) Com comprovem que la anterior ordre s'hagi executat amb èxit?.**

```bash
  1 #! /bin/bash 
  2 
  3 grep -w 8 fitxer
  4 
  5 if [ $? = 0 ]; then
  6         echo "S'ha realitzat l'ordre correctament"
  7         exit 0
  8 else
  9         echo "No s'ha realitzat l'ordre correctament"
 10         exit 1
 11 fi
```



7. **(1 punt ) Crea un fitxer .txt de nom la data i hores actuals a /tmp**

   ```bash
     1  touch /tmp/`date +%Y%m%m`.txt
   ```

   

8. **(1 punt ) Fer un script que rep tres arguments i valida que siguin exactament 3.**

```bash
  1 #! /bin/bash
  2 
  3 # Nom Script
  4 echo $0
  5 
  6 # Primer parametre
  7 echo $1
  8 
  9 # Segon Parametre
 10 echo $2
 11 
 12 # Tercer Parametre
 13 echo $3
 14 
 15 # Comprovació a través d'IF
 16 if [ -n "$1" ];
 17      echo "param $1."
 18 if [ -n "$2" ]; 
 19      echo "param $2."
 20 if [ -n "$3" ]; 
 21       echo "param $3."
 22 else
 23       echo "No hi ha prous parametres per a la verificació."
 24 
 25 # IF que comprova si parametres=3 exactament
 26 if [$@ -eq 3];
 27     echo "Hi han exactament tres parametres"
 28 else 
 29    echo "Hi ha més o menys de 3 paràmetres"
 30 fi
```




9. **(1 punt ) Que fa la següent comanda? cat file1.txt file2.txt file3.txt | sort > file4.txt** 

- Farà un cat de `file1`,`file2` i de `file3`, per a després utilitzar l'ordre `sort` i ordenar línies per tots els paràmetres possibles i inserir tot el contingut dels anteriors "Files" en un fitxer nou anomenat `file4`.

10. **(1 punt ) Si tenim en un fitxer el següent contingut:**

```
one    two    three    four    five
alpha    beta    gamma    delta    epsilon
gener   febrer  març	abril
```

**Quina ordre hem d'executar per obtenir**

```
two
beta
febrer
```

- `cat file.txt  | awk '{print $2}'`
