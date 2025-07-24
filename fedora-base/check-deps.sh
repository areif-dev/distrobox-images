#/usr/bin/env bash

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
stat=0
for dep in ${dependencies}; do
    ! command -v "${dep}" && echo "missing $dep" && stat=1
done
exit $stat
