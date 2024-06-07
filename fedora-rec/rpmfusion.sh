#!/usr/bin/env bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install additional repos
mkdir -p /tmp/extras/
curl -Lo /tmp/extras/rpmfusion-free-release-${RELEASE}.noarch.rpm https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${RELEASE}.noarch.rpm
curl -Lo /tmp/extras/rpmfusion-nonfree-release-${RELEASE}.noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${RELEASE}.noarch.rpm

dnf install -y \
    /tmp/extras/rpmfusion-nonfree-release-${RELEASE}.noarch.rpm \
    /tmp/extras/rpmfusion-free-release-${RELEASE}.noarch.rpm 

