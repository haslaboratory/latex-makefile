#!/bin/bash -ex

CUR_SYSTEM=$(uname -s)

if [[ -f /etc/debian_version ]]; then
    apt install make texlive-full inotify-tools -y
    apt install biber bibtool poppler-utils -y
    apt install python-pygments -y
else
    echo "can't support current system: $SYSTEM"
fi