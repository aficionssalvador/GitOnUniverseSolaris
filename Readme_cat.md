## Introducció

En aquest document es descriu el procés  de instal·lació i configuració de un servidor “git” i un client en Unix Solaris Sparc. El protocol de comunicacions triat es ssh.

Recordeu tenir una copia de seguretat del servidor abans de fer aquestes accions.

Aquest document ha sigut possible gracies a la inestimable col·laboració de [@xrigau](https://github.com/xrigau)

Amb ajuda del traductor de google es manté una versió en angles.

## Instal·lació 

He instal·lat git a partir de: <https://www.opencsw.org/packages/CSWgit/> a la maquina uvsprv00

```
pkgadd -d http://get.opencsw.org/now

/opt/csw/bin/pkgutil -U

/opt/csw/bin/pkgutil -y -i git 

/usr/sbin/pkgchk -L CSWgit # list files
```

## Configuració de ssh

He creat una carpeta de connexió pel meu usuari.

/...../srigau

He modificat “/etc/passwd” per utilitzar aquest directori.

Cal tenir el ".bashrc" per configurar la variable $PATH

```
 -rw-rw----   1 srigau        other         63 dic. 11 12:43 .bashrc
```

 Cal tenir el ".profile" per recuperar  les variables d’entorn per uniVerse

```
 -rw-r--r--   1 srigau        other        759 dic. 11 11:12 .profile
```

Cal tenir/crear el directori .ssh 

```
drwx------   2 srigau         other        512 dic. 11 11:21 .ssh
```

 i dins del directori

```
-rw-------   1 srigau         other        740 dic. 11 11:21 .ssh/authorized_keys
```

Aquest arxiu “.ssh/authorized_keys” conte la clau publica del PC client que es pot trobar en el fitxer “id_rsa.pub” del directori "C:\Users\srigau\.ssh"

```
PS C:\Users\srigau> dir .ssh/*

     Directorio: C:\Users\srigau\.ssh

Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----       10/12/2019     14:29           3243 id_rsa
-a----       10/12/2019     14:29            740 id_rsa.pub
-a----       05/12/2019     12:08           1149 known_hosts
```

Si no es disposa de les claus en el PC-CLIENT jo les vaig regenerar amb https://www.cygwin.com/ pero git incorpora una part de cygwin i les claus es generen amb la instrucció:

```
ssh-keygen 
  (donar al enter dues o tres vegades sense introduir cap passphrase)
```

Si heu seguit aquets passos no cal introduir la contrasenya al connectar el client.

## Instal·lacio servidor git

Per les proves he instal·lat el servidor a:  srigau@uvsprv00:/usr/gitserver/dp1.git (el ideal seria ubicar-lo al núvol) 

```
cd /usr/gitserver
# ó 
mkdir /usr/gitserver
```

```
cd /usr/gitserver
umask 0 ;# o els permisos correctes 
mkddir dp1.git
cd dp1.git
git init –bare --share
```



## Instal·lació  del client de git (compte de programes del servidor) 

Cal crear un client connectat amb “origin/master” de srigau@uvsprv00:/usr/gitserver/dp1.git en el directori “srigau@uvsprv00:/usr/dadesuv/dp1”

Aquesta opcio jo la faig fen un clon del repositori anterior, pero requereix un directori buit

```
umask 0
mkdir /usr/dadesuv/tmp
cd /usr/dadesuv/tmp
git clone file:///usr/gitserver/dp1.git
```

El unic que volem es el contingut del directori .git que ha creat i el deixem al directori del compte de programes.

```
mv /usr/dadesuv/tmp/dp1/.git /usr/dadesuv/dp1
rm -r /usr/dadesuv/tmp
```

Podem configurar el compte amb la informacio del usuari

```
cd /usr/dadesuv/dp1
git congig --local -e
```

He omplert un arxiu .gitignore per que al fer 

```
git add .
```

El que faci es incloure el mateix que (podeu crear un script amb la següent llista)

```
git add PRGH ;# programes
..
git add SUBPRG ;# subrutines
..
git add TXTH ;# includes
```

El important es incorporar tots els directoris de programes fonts sense cap arxiu de dades.

Per últim he pujat al servidor la versió de programes actual.

```
git commit -m 'inicial'
git push 
```

## Configuracio del client amb windows 10

Com client de git a Windows 10 he instal·lat el de <https://git-scm.com/>

Com utilitat client que s’integra amb el explorador triat <https://tortoisegit.org> (jo he utilitzat la opcio OpenSSH)

Com editor jo utilitzo el notepad++ en el que he instal·lat el plugin <https://forum.lowyat.net/topic/1358320/all>

Actualment, crec que Visual Studio Code suposa una millor alternativa.

Per visor de diferencies i mege he instal·lat winmerge <https://downloads.sourceforge.net/winmerge/WinMerge-2.16.4-x64-Setup.exe> configurant aquest últim per integrar les accions de diff i merge del tortoisegit.

Tambe pot ser interesan, tenir instal·lat Putty i WinSCP.

Per clonar el repositori del servidor

```
C:
mkdir c:\uv
cd c:\uv
git clone srigau@uvsprv00:/usr/gitserver/dp1.git
```

Al directori de scripts teniu els exemples

Si feu un canvi en el client windows, cal fer un commit i un push i despres en el servidor fer un pull del servidor.

```
local.GIT_PUSH.bat
UVSPRV00.dp1.GIT_PULL.bat
```

Si feu un canvi directament en el servidor cal fer un commit i un push en el servidor i despres en el client windows fer un pull. 

```
UVSPRV00.dp1.GIT_PUSH.bat
local.GIT_PULL.bat
```

