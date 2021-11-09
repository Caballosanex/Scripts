#! /bin/bash

#Títol         :capçalera.sh
#Descripció    :Aquest Script t'anira bé per aprovar M02. Crea automàticament una capçalera amb totes les dades que tú li introdueixis, assignant permisos i "Shebangs".
#Autor          :Àlex Sánchez Blabia
#data           : 05/03/2021
#Versió        :1.0 (stable)
#Ús            :./capçalera.sh
#Notes          :
#Versió_Bash   :5.0.17(1)-release
#

Avui=$(date +%Y%m%d)

/usr/bin/clear

_select_title(){

    # L'usuari introdueix un "Title" per al Script.
    printf "Introdueix el nom del teu Script: " ; read -r title

    # Elimina els espais del "Title" en cas de que n'hi hagin.
    title=${title// /_}

    # No posis majúscules burro, que he d'afegir una línea nova per a convertir-ho tot.
    title=${title,,}

    # Afegeix l'extensió .sh al fitxer a menys que ja hi sigui.
    [ "${title: -3}" != '.sh' ] && title=${title}.sh

    # Busca si el fitxer ja existeix o s'ha creat amb anterioritat.
    if [ -e $title ] ; then
        printf "\n%s\n%s\n\n" "L'Script \"$title\" ja existeix." \
        "Canvia el nom del teu Script."
        _select_title
    fi

}

_select_title

printf "Escriu la descripció del teu Script: " ; read -r dscrpt
printf "Escriu el TEU nom i Cognoms: " ; read -r name
printf "Escriu el número de versió del teu Script: " ; read -r vnum

# Formata la sortida de les dades i les volca a un fitxer nou.
printf "%-16s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%s\n\n\n" '#!/bin/bash -' '#Títol' ":$title" '#Descripció' \
":${dscrpt}" '#Autor' ":$name" '#data' ":$avui" '#Versió' \
":$vnum" '#Ús' ":./$title" '#Notes' ':' '#Versió_Bash' \
":${BASH_VERSION}" \#$div${div} > $title

# Canvia els permisos del fitxer per a que sigui executable.
chmod +x $title

/usr/bin/clear

_select_editor(){

    # Vols obrir el fitxer amb VIM o Emacs?
    printf "%s\n%s\n%s\n\n" "Selecciona un editor de text." "1 = VIM." "2 = Emacs."
    read -r editor

    # Obra l'arxiu i sitúa el cursor a dotzena linea.
    case $editor in
        1) vim +12 $title
            ;;
        2) emacs +12 $title &
            ;;
        *) /usr/bin/clear
           printf "%s\n%s\n\n" "Aixó no es un número vàlid. Imbécil." \
               "Prém <Ctrl-c> per a cancel·lar."
           _select_editor
            ;;
    esac

}

_select_editor
