#!/bin/bash
# Gera o arquivo inventory.ini automaticamente a partir do .env
DIR=$(dirname "$0")
cd "$DIR"

if [ ! -f .env ]; then
  echo "Arquivo .env não encontrado!"
  exit 1
fi

set -a
source .env
set +a

cat <<EOF > inventory.ini
[portfolio]

$ANSIBLE_HOST ansible_user=$ANSIBLE_USER ansible_ssh_private_key_file=$ANSIBLE_KEY
EOF

echo "Arquivo inventory.ini gerado com sucesso!"
