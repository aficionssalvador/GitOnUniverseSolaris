## Introducció

En aquest document es descriu el procés  de instal·lació i configuració de un servidor “git” i un client en Unix Solaris Sparc. El protocol de comunicacions triat es ssh.

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

Si no es disposa de les claus en el PC-CLIENT jo les vaig regenerar amb <https://www.cygwin.com/> es generen amb la instrucció

```
ssh-keygen 
  (donar al enter dues o tres vegades sense introduir cap passphrase)
```

Si heu seguit aquets passos no cal introduir la contrasenya al connectar el client.