#!/bin/bash -e

CUR_SYSTEM=$(uname -s)
PWD=$(pwd)
MAKEFILE=$PWD/.makefile
TMPFILE=$MAKEFILE/.dependencies_tmp

if test -f /etc/debian_version; then
    if test ! -f $TMPFILE; then
        apt install make texlive-full inotify-tools -y
        apt install biber bibtool poppler-utils -y
        apt install python-pygments -y
        touch $TMPFILE
    else
        echo "installed dependencies previously."
    fi
else
    echo "can't support current system: $CUR_SYSTEM"
fi