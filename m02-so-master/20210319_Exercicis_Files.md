## 20210319 Exercicis Files

### **exercici1.sh**

"Quin ordre ens dóna la información sobre caducitat i validesa dels usuaris del Sistema"

Escriu un script que ens dongui informació sobre la caducitat i validesa dels usuaris del Sistema.

- Si l'ordre retorna un estat de sortida 0, informeu que "l'ordre s'ha realitzat correctament" i sortiu amb un estat de sortida 0.
- Si l'ordre retorna un estat de sortida diferent de zero, informeu "Comanda fallida" i sortiu amb un estat de sortida 1.

### **exercici2.sh**

"Quina ordre fem servir per mostrar els fitxers d'un directori?. "
"Quina ordre fem servir, per comptar el número de fitxers d'un directori?"

Mostra el nombre de fitxers al directori de treball actual.

### **exercici3.sh**

Modifiqueu l'exercici2, per que mostri el nombre de fitxers donat el directori /var 

### **exercici4.sh**

"Amb bash, que hem de fer per demanar dades per consola a un usuari?"
"Amb bash, com recorrem tots els fitxers amb extensió .jpg d'un directori?"
"Amb bash, com comprovem si una variable té valor? "
"Quina comanda fem servir per renombrar un fitxer?"

Farem un script per renombrar el nom dels fitxers segons l'extensió.

1. Preguntar a l’usuari quina extensió de fitxer volem considerar. ( per exemple .jpg )
2. Preguntar a l’usuari quin prefix vol afegir als noms del fitxer per identificar-los.
   \- Per defecte, el prefix ha de ser la data actual en format AAAA-MM-DD.
   \- Si l'usuari simplement prem Retorn, s'utilitzarà la data actual.
   \- En cas contrari, s’utilitzarà com a prefix el que hagi introduït l’usuari.
3. A continuació, ha de mostrar el nom del fitxer original i el nom nou del fitxer.
4. Finalment, heu de canviar el nom del fitxer.

### **repte.sh**

"Quina comanda fem servir per netejar la consola?"
"Amb bash, com comprovem si un fitxer existeix"
"Amb bash, com creem i/o actualitzem el contingut d’un fitxer "
"Amb bash, com escrivim contingut en un fitxer "
"Amb bash, com fem un menú d'opcions" 

Realitzar un script per inserir números a un fitxer, de manera que quedi endreçat. Que els esborri. Que ens digui si el nombre que volem consultar està o no en el fitxer. I per finalitzar que es pugui visualitzar el contingut del fitxer.

Fes un menú per demanar les dades per consola

1. Insereix números a un fitxer.
2. Esborra números del fitxer.
3. Quin número vols trobar en el Fitxer?.
4. Visualitza el contingut del fitxer.
5. Sortir
   --- Escull una opció de menú