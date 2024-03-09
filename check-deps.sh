#!/usr/bin/env bash 

dependencies="
    bc
    bzip2
    chpasswd
    curl
    diff
    find
    findmnt
    gpg
    hostname
    less
    lsof
    man
    mount
    passwd
    pigz
    pinentry
    ping
    ps
    rsync
    script
    ssh
    sudo
    time
    tree
    umount
    unzip
    useradd
    wc
    wget
    xauth
    zip
"
for dep in ${dependencies}; do
    if ! command -v "${dep}"; then
        echo "missing $dep"
        exit 1 
    fi
done

exit 0
