#!/usr/bin/env bash 

TIDAL_HIFI_VERSION=$(curl -s "https://api.github.com/repos/Mastermindzh/tidal-hifi/releases/latest" | grep '"tag_name"' | sed -E 's/.*"v?([^"]+)".*/\1/')
curl -Lo "/tmp/extras/tidal-hifi-${TIDAL_HIFI_VERSION}.x86_64.rpm" "https://github.com/Mastermindzh/tidal-hifi/releases/download/${TIDAL_HIFI_VERSION}/tidal-hifi-${TIDAL_HIFI_VERSION}.x86_64.rpm"
dnf install -y "/tmp/extras/tidal-hifi-${TIDAL_HIFI_VERSION}.x86_64.rpm"

FREETUBE_VERSION=$(curl -s "https://api.github.com/repos/FreeTubeApp/FreeTube/releases" | grep -m 1 '"html_url": "https://github.com/FreeTubeApp/FreeTube/releases/tag' | grep -oP 'v\K[0-9]+\.[0-9]+\.[0-9]+')
curl -Lo "/tmp/extras/freetube_${FREETUBE_VERSION}_amd64.rpm" "https://github.com/FreeTubeApp/FreeTube/releases/download/v${FREETUBE_VERSION}-beta/freetube_${FREETUBE_VERSION}_amd64.rpm"
dnf install -y "/tmp/extras/freetube_${FREETUBE_VERSION}_amd64.rpm"

HEROIC_VERSION=$(curl -s "https://api.github.com/repos/Heroic-Games-Launcher/HeroicGamesLauncher/releases/latest" | grep '"tag_name"' | sed -E 's/.*"v?([^"]+)".*/\1/')
curl -Lo "/tmp/extras/heroic-${HEROIC_VERSION}.x86_64.rpm" "https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v${HEROIC_VERSION}/heroic-${HEROIC_VERSION}.x86_64.rpm"
dnf install -y "/tmp/extras/heroic-${HEROIC_VERSION}.x86_64.rpm"
