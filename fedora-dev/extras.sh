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

#echo "Downloading ollama"
#OLLAMA_VERSION=$(curl -s "https://api.github.com/repos/ollama/ollama/releases/latest" | jq -r '.tag_name' | sed 's/v//')
#curl -L -o "/tmp/extras/ollama-linux-amd64.tgz" "https://github.com/ollama/ollama/releases/download/v${OLLAMA_VERSION}/ollama-linux-amd64.tgz"
## curl -L -o "/tmp/extras/ollama-linux-amd64-rocm.tgz" "https://github.com/ollama/ollama/releases/download/v${OLLAMA_VERSION}/ollama-linux-amd64-rocm.tgz"
#curl -L -o "/tmp/extras/ollama-sha256sum.txt" "https://github.com/ollama/ollama/releases/download/v${OLLAMA_VERSION}/sha256sum.txt"
#EXPECTED_OLLAMA_AMD64_SUM=$(grep './ollama-linux-amd64.tgz' /tmp/extras/ollama-sha256sum.txt | awk '{print $1}')
## EXPECTED_OLLAMA_ROCM_SUM=$(grep './ollama-linux-amd64-rocm.tgz' /tmp/extras/ollama-sha256sum.txt | awk '{print $1}')
#ACTUAL_OLLAMA_AMD64_SUM=$(sha256sum /tmp/extras/ollama-linux-amd64.tgz | awk '{print $1}')
## ACTUAL_OLLAMA_ROCM_SUM=$(sha256sum /tmp/extras/ollama-linux-amd64-rocm.tgz | awk '{print $1}')
#if [ ! "$EXPECTED_OLLAMA_AMD64_SUM" == "$ACTUAL_OLLAMA_AMD64_SUM" ]; then
#    echo "Ollama AMD64 checksums do not match"
#    exit 1
#fi
## if [ ! "$EXPECTED_OLLAMA_ROCM_SUM" == "$ACTUAL_OLLAMA_ROCM_SUM" ]; then
##     echo "Ollama ROCM checksums do not match"
##     exit 1
## fi
#echo "Extracting ollama"
#tar -C "/tmp/extras" -xzf "/tmp/extras/ollama-linux-amd64.tgz" --checkpoint=10000
#mv /tmp/extras/bin/* /usr/bin/
#mv /tmp/extras/lib/* /usr/lib/
# tar -C /usr -xzf "/tmp/extras/ollama-linux-amd64-rocm.tgz"
