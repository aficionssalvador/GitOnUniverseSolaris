## Introduction

This document describes the installation and configuration process for a "git" server and a client on Unix Solaris Sparc. The communication protocol of choice is ssh.

With the help of the google translator an English version is maintained.

## Installation

I have installed git from: <https://www.opencsw.org/packages/CSWgit/> on uvsprv00 machine

```
pkgadd -d http://get.opencsw.org/now

/opt/csw/bin/pkgutil -U

/opt/csw/bin/pkgutil -y -i git 

/usr/sbin/pkgchk -L CSWgit # list files
```



## ssh configuration

I have created a connection folder for my user.

/...../srigau

I modified "/ etc / passwd" to use this directory.

You need to have the ".bashrc" to configure the $ PATH variable

```
 -rw-rw ---- 1 srigau other 63 Dec 11 12:43 .bashrc
```

 You must have the ".profile" to retrieve the environment variables for uniVerse

``
 -rw-r - r-- 1 srigau other 759 Dec 11 11:12 PM
``

The .ssh directory must be created / created

``
drwx ------ 2 srigau other 512 Dec 11 11:21 .ssh
``

 and inside the directory

``
-rw ------- 1 srigau other 740 Dec 11 11:21 .ssh / authorized_keys
``

This file ".ssh / authorized_keys" contains the public key of the client PC that can be found in the file "id_rsa.pub" of the directory "C: \ Users \ srigau \ .ssh"

```
PS C:\Users\srigau> dir .ssh/*

     Directorio: C:\Users\srigau\.ssh

Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----       10/12/2019     14:29           3243 id_rsa
-a----       10/12/2019     14:29            740 id_rsa.pub
-a----       05/12/2019     12:08           1149 known_hosts
```

If the keys are not available on the PC-CLIENT I regenerated them with <https://www.cygwin.com/> they are generated with the instruction

```
ssh-keygen
  (give the integer two or three times without entering a passphrase)
```

If you have followed these steps, you do not need to enter the password when connecting the client.

