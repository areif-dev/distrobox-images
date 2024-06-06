#!/usr/bin/env bash 

COSIGN_VERSION=$(curl -s "https://api.github.com/repos/sigstore/cosign/releases/latest" | jq -r '.tag_name' | sed 's/v//')

curl -L -o "/tmp/extras/cosign-${COSIGN_VERSION}-1.x86_64.rpm" "https://github.com/sigstore/cosign/releases/download/v${COSIGN_VERSION}/cosign-${COSIGN_VERSION}-1.x86_64.rpm"
dnf install -y "/tmp/extras/cosign-${COSIGN_VERSION}-1.x86_64.rpm"
