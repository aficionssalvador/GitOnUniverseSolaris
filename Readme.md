## Introduction

This document describes the installation and configuration process for a "git" server and a client on Unix Solaris Sparc. The communication protocol of choice is ssh.

Remember to backup your server before doing these actions

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

## Git server installation

For testing I installed the server at: @ @ uvsprv00: /usr/gitserver/dp1.git (the ideal would be to place it in the cloud)

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

## Git client installation (server program account)

You need to create a client connected to the "origin / master" of the @ uvsprv00: /usr/gitserver/dp1.git

in the directory "srigau @ uvsprv00: / usr / datauv / dp1"

This option I make is a clone of the previous repository, but it requires an empty directory

```
umask 0
mkdir /usr/dadesuv/tmp
cd /usr/dadesuv/tmp
git clone file:///usr/gitserver/dp1.git
```

The only thing we want is the contents of the .git directory that you created and leave it in the program account directory.

```
mv /usr/dadesuv/tmp/dp1/.git /usr/dadesuv/dp1
rm -r /usr/dadesuv/tmp
```

We can configure the account with user information

```
cd /usr/dadesuv/dp1
git congig --local -e
```

I filled out a .gitignore file for that when doing

```
git add .
```

What you do is include the same as (you can create a script with the following list)

```
git add PRGH ;# programes
..
git add SUBPRG ;# subrutines
..
git add TXTH ;# includes
```

The important thing is to incorporate all the source program directories without any data file.

Lastly I uploaded the current program version to the server.

```
git commit -m 'inicial'
git push 
```

## Client configuration with windows 10

As a git client in Windows 10, I have installed <https://git-scm.com/>

As a client utility that integrates with your chosen browser <https://tortoisegit.org> (I used the OpenSSH option)

As an editor I use notepad ++ where I installed the plugin <https://forum.lowyat.net/topic/1358320/all>

Currently, I think Visual Studio Code is a better alternative.

For differences viewer and mege I installed winmerge <https://downloads.sourceforge.net/winmerge/WinMerge-2.16.4-x64-Setup.exe> configuring the latter to integrate tortoisegit diff and merge actions.

It may also be interesting to have Putty and WinSCP installed.

To clone the server repository

```
C:
mkdir c:\uv
cd c:\uv
git clone srigau@uvsprv00:/usr/gitserver/dp1.git
```

Here are the examples in the script directory

If you make a change on the windows client, you have to make a commit and then push on the server to make a pull from the server.

```
local.GIT_PUSH.bat
UVSPRV00.dp1.GIT_PULL.bat
```

If you make a change directly to the server, you need to make a commit and push on the server and then on the windows client make a pull. 

```
UVSPRV00.dp1.GIT_PUSH.bat
local.GIT_PULL.bat
```

