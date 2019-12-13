#
# Define default prompt to <username>@<hostname>:<path><"($|#) ">
# and print '#' for user "root" and '$' for normal users.
#
PATH=$PATH:/...directori_universe../uv/bin:/opt/csw/bin

typeset +x PS1="\u@\h:\w\\$ "

export PATH
umask 0
