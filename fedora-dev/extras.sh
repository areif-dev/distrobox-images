#!/usr/bin/env bash 

echo "Installing Cosign"
COSIGN_VERSION=$(curl -s "https://api.github.com/repos/sigstore/cosign/releases/latest" | jq -r '.tag_name' | sed 's/v//')
curl -L -o "/tmp/extras/cosign-${COSIGN_VERSION}-1.x86_64.rpm" "https://github.com/sigstore/cosign/releases/download/v${COSIGN_VERSION}/cosign-${COSIGN_VERSION}-1.x86_64.rpm"
dnf install -y "/tmp/extras/cosign-${COSIGN_VERSION}-1.x86_64.rpm"

echo "Installing Starship Prompt"
STARSHIP_VERSION=$(curl -s "https://api.github.com/repos/starship/starship/releases/latest" | jq -r '.tag_name' | sed 's/v//')
curl -L -o "/tmp/extras/starship-x86_64-unknown-linux-gnu.tar.gz" "https://github.com/starship/starship/releases/download/v${STARSHIP_VERSION}/starship-x86_64-unknown-linux-gnu.tar.gz"
curl -L -o "/tmp/extras/starship-x86_64-unknown-linux-gnu.tar.gz.sha256" "https://github.com/starship/starship/releases/download/v${STARSHIP_VERSION}/starship-x86_64-unknown-linux-gnu.tar.gz.sha256"
EXPECTED_STARSHIP_SUM=$(cat /tmp/extras/starship-x86_64-unknown-linux-gnu.tar.gz.sha256)
ACTUAL_STARSHIP_SUM=$(sha256sum /tmp/extras/starship-x86_64-unknown-linux-gnu.tar.gz | awk '{print $1}')
if [ "$EXPECTED_STARSHIP_SUM" == "$ACTUAL_STARSHIP_SUM" ]; then
    echo "Starship checksum matches"
    tar -xzf "/tmp/extras/starship-x86_64-unknown-linux-gnu.tar.gz" -C "/tmp/extras"
    mv /tmp/extras/starship /usr/bin
else 
    echo "Starship checksums do not match"
    exit 1
fi

echo "Downloading ollama"
EXPECTED_OLLAMA_SUM="aa4d22c62c62de2de55329a4699fd9e7a6a0728d4d8266cd8853d5f6a896f445  /tmp/extras/ollama.sh"
curl -L -o "/tmp/extras/ollama.sh" "https://ollama.com/install.sh"
ACTUAL_OLLAMA_SUM="$(sha256sum /tmp/extras/ollama.sh)"
if [ ! "$EXPECTED_OLLAMA_SUM" == "$ACTUAL_OLLAMA_SUM" ]; then
    echo "Ollama checksums do not match"
    exit 1
fi
cat /tmp/extras/ollama.sh | sh
