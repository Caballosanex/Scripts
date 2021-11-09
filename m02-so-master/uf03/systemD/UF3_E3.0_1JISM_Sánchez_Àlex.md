# Autor:          UF3_E3.0_Grup_Cognom_alumne.md
# Date:           16/04/21
# Description:    E3. Exercici 0. Treball de recerca sobre el SystemD

## 1. Qué és systemD?. Qué és SysV?. 

- systemd és un gestor de sistemes i serveis per a sistemes operatius Linux. Quan s’executa com a primer procés d’arrencada (com a PID 1), actua com a sistema d’inici que genera i manté l’espai dels usuaris serveis. S’inicien instàncies separades perquè els usuaris connectats iniciïn els seus serveis.
- L'inici de SysV és un procés estàndard utilitzat per Red Hat Linux per controlar quin programari inicia o tanca l'ordre init en un nivell d'execució determinat.

## 2. En quin fitxer es troba la configuració general de systemd?

- /sbin/init symlink

## 3. Quina comanda fem servir per saber la versió actual de SystemD? 

- [ism40567750@g25 ~]$ systemctl --version
  systemd 245 (v245.9-1.fc32)

## 4. Que són les units en un systemD?. Fica 3 exemples.

- A systemd, una unit fa referència a qualsevol recurs que el sistema sàpiga com operar i gestionar. Aquest és l'objecte principal amb què saben tractar les eines del sistema. Aquests recursos es defineixen mitjançant fitxers de configuració anomenats fitxers unit

  - sys-devices-pci0000:00-0000:00:1b.0-sound-card0-controlC0.device

  - sys-devices-pci0000:00-0000:00:1c.4-0000:02:00.0-net-enp2s0.device 

  - sys-devices-pci0000:00-0000:00:1f.2-ata1-host0-target0:0:0-0:0:0:0-block-sda-sda1.device

## 5. Quina informació trobem en els fitxers amb extensió .swap?

- Un fitxer d'intercanvi és un fitxer que conté dades recuperades de la memòria del sistema o RAM. En transferir dades de la memòria RAM a un dispositiu d’emmagatzematge secundari en forma de fitxer d’intercanvi, un ordinador pot alliberar memòria per a altres programes. Els fitxers d'intercanvi són un tipus de memòria virtual, ja que no s'emmagatzemen a la memòria RAM física.

## 6. Que consultem amb la següent comanda?
```
   systemctl list-units --type service

```

```UNIT                                          LOAD   ACTIVE SUB     DESCRIPTION ```

Ens llista tots els units de tipus "servei" amb informació com, si està arrencat, actiu, i corrent en el sistema, junt a una descripció

## 7. Quins estats pot tenir una Unit?. Fes una descripció.

- LOAD: Els fitxers unit s'han carregat des d’un conjunt de camins determinats durant la compilació.
- ACTIVE: El servei està actiu en la sessió actual

## 8. Els arxius de configuració de les Units ( siguin del tipus que siguin ) en quines 3 carpetes poden estar repartides?

- | Type of **unit configuration files**         | Location                |
  | :------------------------------------------- | :---------------------- |
  | Default **unit configuration files**         | /usr/lib/systemd/system |
  | Run-time **unit configuration files**        | /run/systemd/system     |
  | System specific **unit configuration files** | /etc/systemd/system     |

## 9. Com podem afegir ( o sobreescriure ) opcions de configuració concretes, sense tenir que tocar les configuracions genèriques de la unit?

- La configuració predeterminada s'estableix durant la compilació, de manera que la configuració només és necessària quan cal desviar-se d'aquests valors predeterminats. Inicialment, el fitxer de configuració principal de /etc/systemd/ conté entrades comentades que mostren els valors predeterminats com a guia per a l'administrador. Es poden crear anul·lacions locals editant aquest fitxer o creant desplegables, tal com es descriu a continuació. Es recomana fer servir desplegables per a la configuració local per sobre de les modificacions al fitxer de configuració principal.

## 10. Algunes "units" contenen el símbol @ en el seu nom (per exemple, nom@cadena.service); Que significa?

- El símbol `@` és per a serveis especials, sòcols i altres unitats on es poden executar diverses instàncies. Per exemple, getty@.service és el servei que proporciona terminals d’inici de sessió de text.

## 11. Les següents comandes serveixen per gestionar Units. Descriu el que fa cada una d'elles:

## 13. Com reiniciem una Unit?. Posa un exemple per exemple de una Unit de tipus socket


## 14. Com sabem si un unit està activado, desactivado o ha fallat?
- systemctl status sshd.service | grep Active

## 15. Quina comanda fem servir si volem instalLar el servidor web apache2 (httpd)?

`sudo dnf install httpd`

## 16. Què són els targets en SystemD?

- Un fitxer de configuració de la unitat el nom del qual acaba en ".target" codifica informació sobre una unitat de destinació de systemd, que s'utilitza per agrupar unitats i punts de sincronització coneguts durant l'inici.

## 17. Qué és un servei?. Com es crea un servei amb SystemD?. Quina estructura té? A on es creen?

1. `cd /etc/systemd/system`

2. Creeu un fitxer anomenat your-service.service i incloeu el següent Definirem la seva estructura i el seu directori):

   ```ruby
   [Unit]
   Description=<description about this service>
   
   [Service]
   User=<user e.g. root>
   WorkingDirectory=<directory_of_script e.g. /root>
   ExecStart=<script which needs to be executed>
   Restart=always
   
   [Install]
   WantedBy=multi-user.target 
   ```

3. Torneu a carregar els fitxers de servei per incloure el servei nou.

   `sudo systemctl daemon-reload`

   

4. Inicia el teu servei
   `sudo systemctl start your-service.service`

   

5. Verifica l'estat del teu servei
   `sudo systemctl status example.service`

   

6. Per a que corri a cada reinici

   `sudo systemctl enable example.service`

   

7. Per a que no corri a cada reinici

   `sudo systemctl disable example.service`````

## 18. Una vegada creat un servei, que hem de fer perque el systemctl el tingui en compte?

- Valideu amb `sudo systemd-analysis verify NAME.service`
  Quan s'utilitzi un enllaç simbòlic, assegurar-se que utilitzi la seva ruta absoluta
  Assegureu-vos que el nom sigui com /etc/systemd/system/*.service
  Fer `sudo systemctl daemon-reload` després de fer canvis

## 19. Com podem comprovar informació relacionada amb la execucio dels serveis? 

```systemctl status {service-name}```

```systemctl status {unit-name}```

Triem la comanda que ens convingui segons si treballem amb units o amb serveis

## 20. Sota systemD, qui és l'encarregat de recolectar i emmagatzemar l'activitat del que va passant al sistema?

- `journalctl` o els logs del propi sistema ```/var/log/syslog```
