#
# Simple profile places /usr/bin at front, followed by /usr/sbin.
#
# Use less(1) or more(1) as the default pager for the man(1) command.
#
export PATH=/usr/bin:/usr/sbin:/bin:/sbin:/...directori_universe../uv/bin:/opt/csw/bin

if [ -f /usr/bin/less ]; then
    export PAGER="/usr/bin/less -ins"
elif [ -f /usr/bin/more ]; then
    export PAGER="/usr/bin/more -s"
fi

#
# Define default prompt to <username>@<hostname>:<path><"($|#) ">
# and print '#' for user "root" and '$' for normal users.
#
# Currently this is only done for bash/pfbash(1).
# 

case ${SHELL} in
*bash)
    typeset +x PS1="\u@\h:\w\\$ "
    ;;
esac 

LANG=es;export LANG
LC_ALL=es;export LC_ALL
# si el protocol no es SSH pot executar un segon script
# pero si es SSH cal entrar en sistema operatiu
if [ -z "${SSH_CONNECTION}" ]
then
  . ../segon_profile
  exit
fi

