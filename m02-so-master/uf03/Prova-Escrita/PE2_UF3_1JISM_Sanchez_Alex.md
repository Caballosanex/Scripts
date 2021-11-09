## Autor:          PE2_UF3_Grup_Cognom_alumne.md
## Date:           28/05/21
## Description:    Prova M03 - UF03 SystemD, Journal, Firewall, Quotes
## Entrega Prova escrita UF3

En finalitzar l'exercici, el fitxer l'heu d'annexar al Moddle, **anomena'l amb el següent format: PE2_UF3_Grup_Cognom_nom.md**
També, recorda pujar-ho al GIT, a la carpeta UF3/prova-escrita/

## Enunciat

Estem encarregats d'administrar el sistema operatiu linux d'un servidor a la nostra empresa. Se'ns demana que fem diverses coses per tal d'obtenir un servidor amb les funcionalitats que es requereixen:

- Cal un servidor web.
- Caldrà establir un tallafocs per tal que no ens accedeixin a ports que no siguin públics.
- Caldrà un accés de ssh per a la gestió remota d'aquest servidor, però volen que només sigui accessible en horari d'oficina (tot i que la màquina estarà en funcionament tot el dia)

1. [2 punts] **Cal que aquesta màquina vostra tingui accés per ssh i que estigui en hora. Per això comprovarem els serveis:**

    - [0,25 punts] Ordre per activar el servei de ssh en iniciar el sistema operatiu:

      - `sudo systemctl enable sshd`

    - [0,25 punts] Ordre per arrencar ara el servei de ssh:

      - `sudo systemctl start sshd`

    - [0,25 punts] Odre i sortida per veure l'estat del servei ssh:

      - `sudo systemctl status sshd`

      - > ● sshd.service - OpenSSH server daemon
        >      Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: disabled)
        >      Active: active (running) since Fri 2021-05-28 07:17:43 +01; 9s ago
        >        Docs: man:sshd(8)
        >              man:sshd_config(5)
        >    Main PID: 6402 (sshd)
        >       Tasks: 1 (limit: 9371)
        >      Memory: 2.1M
        >         CPU: 16ms
        >      CGroup: /system.slice/sshd.service
        >              └─6402 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
        >
        > May 28 07:17:43 g28 systemd[1]: Starting OpenSSH server daemon...
        > May 28 07:17:43 g28 sshd[6402]: Server listening on 0.0.0.0 port 22.
        > May 28 07:17:43 g28 sshd[6402]: Server listening on :: port 22.
        > May 28 07:17:43 g28 systemd[1]: Started OpenSSH server daemon.

    - [0,25 punts] Ordre per activar el servei d'hora en iniciar el sistema operatiu:

      - `sudo systemctl enable systemd-timesyncd`

    - [0,25 punts] Ordre per arrencar ara el servei d'hora:

      - `sudo systemctl start systemd-timesyncd`

    - [0,25 punts] Ordre i sortida per veure l'estat del servei d'hora:

      - `sudo systemctl status systemd-timesyncd`

      - > ● systemd-timesyncd.service - Network Time Synchronization
        >      Loaded: loaded (/usr/lib/systemd/system/systemd-timesyncd.service; enabled; vendor preset: disabled)
        >      Active: active (running) since Fri 2021-05-28 07:18:52 +01; 3s ago
        >        Docs: man:systemd-timesyncd.service(8)
        >    Main PID: 6497 (systemd-timesyn)
        >      Status: "Initial synchronization to time server 5.56.160.3:123 (0.fedora.pool.ntp.org)."
        >       Tasks: 2 (limit: 9371)
        >      Memory: 1.8M
        >         CPU: 68ms
        >      CGroup: /system.slice/systemd-timesyncd.service
        >              └─6497 /usr/lib/systemd/systemd-timesyncd
        >
        > May 28 07:18:52 g28 systemd[1]: Starting Network Time Synchronization...
        > May 28 07:18:52 g28 systemd[1]: Started Network Time Synchronization.
        > May 28 07:18:52 g28 systemd-timesyncd[6497]: Initial synchronization to time server 5.56.160.3:123 (0.fedora.pool.ntp.org).

    - [0,5 punts] Ordre per veure tots els seveis que es troben arrencats actualment:
      - `sudo systemctl list-units --type service`

2. [2 punts] **Instal.leu ara el servidor web nginx. Aquest servidor ens permetrà tenir un servei en producció:**

    - [0,50 punts] Ordre per instal.lar el servidor web nginx al vostre sistema operatiu:
      - `sudo dnf install nginx`
    - [0,50 punts] Ordre per activar el servei nginx en iniciar el sistema operatiu:
      - `sudo systemctl enable nginx`
    - [0,50 punts] Ordre per arrencar ara el servei nginx:
      - `sudo systemctl start nginx`

    - [0,50 punts] Ordre i sortida per a veure els últims 10 missatges de log del servei nginx:

      - `sudo journalctl -u nginx.service -n`

      - > [root@g28 ~]# journalctl -u nginx.service -n
        > -- Logs begin at Tue 2020-09-15 11:05:42 +01, end at Fri 2021-05-28 07:24:33 +01. --
        > May 28 07:21:41 g28 systemd[1]: Starting The nginx HTTP and reverse proxy server...
        > May 28 07:21:41 g28 nginx[6774]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
        > May 28 07:21:41 g28 nginx[6774]: nginx: configuration file /etc/nginx/nginx.conf test is successful
        > May 28 07:21:41 g28 nginx[6775]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
        > May 28 07:21:41 g28 nginx[6775]: nginx: [emerg] bind() to [::]:80 failed (98: Address already in use)
        > May 28 07:21:41 g28 nginx[6775]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
        > May 28 07:21:41 g28 nginx[6775]: nginx: [emerg] bind() to [::]:80 failed (98: Address already in use)
        > May 28 07:21:42 g28 nginx[6775]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
        > May 28 07:21:42 g28 nginx[6775]: nginx: [emerg] bind() to [::]:80 failed (98: Address already in use)
        > May 28 07:21:42 g28 nginx[6775]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
        > May 28 07:21:42 g28 nginx[6775]: nginx: [emerg] bind() to [::]:80 failed (98: Address already in use)
        > May 28 07:21:43 g28 nginx[6775]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
        > May 28 07:21:43 g28 nginx[6775]: nginx: [emerg] bind() to [::]:80 failed (98: Address already in use)
        > May 28 07:21:43 g28 nginx[6775]: nginx: [emerg] still could not bind()
        > May 28 07:21:43 g28 systemd[1]: nginx.service: Control process exited, code=exited, status=1/FAILURE
        > May 28 07:21:43 g28 systemd[1]: nginx.service: Failed with result 'exit-code'.
        > May 28 07:21:43 g28 systemd[1]: Failed to start The nginx HTTP and reverse proxy server.

3. [2 punts] **Ara cal assegurar el servei ssh i el web com a els únics als que permetem accés:**

   - [0,25 punts] Ordre per activar el servei de tallafocs en iniciar el sistema operatiu:

     - `sudo systemctl enable firewalld `

   - [0,25 punts] Ordre per arrencar ara el servei de tallafocs:

     - `sudo systemctl start firewalld`

   - [0,25 punts] Ordre i sortida on es vegi els ports que el tallafocs està filtrant actualment i la zona activa:

     - `sudo firewall-cmd --zone=public --list-all`

   - [0,5 punts] Ordre(s) per tal d'aconseguir que només siguin accessibles els ports 22 i 80 del servidor a partir de la informació mostrada en l'ordre anterior:

     - `sudo firewall-cmd --zone=public --add-port=22/tcp`	**PORT 22**
     - `sudo firewall-cmd --zone=public --add-port=80/tcp`    **PORT 80**

   - [0,5 punts] Ordre i sortida on es vegi els ports que el tallafocs està filtrant actualment i la zona activa: 

     - `sudo firewall-cmd --zone=public --list-all`

     - > public
       >   target: default
       >   icmp-block-inversion: no
       >   interfaces: 
       >   sources: 
       >   services: dhcpv6-client mdns ssh
       >   ports: 
       >   protocols: 
       >   masquerade: no
       >   forward-ports: 
       >   source-ports: 22/tcp 80/tcp
       >   icmp-blocks: 
       >   rich rules: 

   - [0,25 punts] Feu que aquesta configuració sigui permanent. Indiqueu la/les ordre(s) per a fer-ho:

     - `sudo firewall-cmd --zone=public --permanent --add-port=80/tcp`
     - `sudo firewall-cmd --zone=public --permanent --add-port=22/tcp`

4. [2 punts] **Feu ara dos scripts que comprovin l'estat del servei nginx. Un l'haurà d'arrencar si no ho està i l'altre l'haurà d'aturar si està arrencat**

    - [0,5 punts] Script que comprova si està arrencat i l'atura

      - ```bash
        #!/bin/bash
        STOP=$(systemctl stop nginx)
        COMPROVA=$(systemctl stop nginx)
        if [ $COMPROVA == active ];then
        $STOP
        fi
        ```

        

    - [0,5 punts] Script que comprova si està aturat i l'arrenca

      - ```bash
        #!/bin/bash
        STOP=$(systemctl stop nginx)
        START=$(systemctl start nginx)
        systemctl is-active nginx
        if [ $? == 0 ];then
        $STOP
        else
        $START
        fi
        ```

        

    - [0,5 punts] Què hauríem de canviar al nostre script per tal que enviés un missatge de prioritat 'info' al journal amb informació que ens digui si l'hem arrencat o si l'hem parat?

      - Sota la linea $STOP hauríem d'afegir: `echo 'Misatge informatiu' | systemd-cat -p info`

    - [0,5 punts] Com podem veure els missatges de prioritat 'info' del log?

      - `journalctl -p info`

5. [2 punts]  **Una mica sobre quotes:** 
   - [0,25 punts] Per a que serveixen les quotes de disc?
      - Una **Quota** serveix per a limitar la quantitat de dades que un usuari o un grup d'usuaris pot emmagatzemar en un disc o partició. Hi han diferents tipus de Quotes però les limitarem a **soft** i a **hard**
      - 
   - [0,50 punts] creem un disc virtual de 80Mb anomenat examen a la carpeta /home/
     + `sudo dd if=/dev/zero of=/home/disc bs=80K count=1024`
   - [0,25 punts] Al disc virtual que acabem de crear li donem format ext4
     + `sudo mkfs -t ext4 /home/disc`
   - [0,50 punts] Montem l'arxiu examen a la carpeta /mnt/usuari
     + `sudo mount -o loop /home/users/inf/jism1/ism40567750 /mnt/usuaris`
   - [0,25 punts] Quin fitxer hem de modificar, per tal de que es munti el disc automàticament en reiniciar el sistema. 
      + Hem de modificar el fitxer `/etc/fstab`
   - [0,25 punts] Que és un inode?
      - Un **Inode** es un registre intern que conté el disc. Aquest registre pot contenir informació que Abarca els arxius, carpetes, pes d'aquestes, propietaris, permisos, rutes... SEMPRE sense guardar en aquest registre l'informació que contenen els arxius

