#!/bin/bash
# setup-docker-repo.sh — Agrega el repositorio oficial de Docker en Debian 12 (64 bits)
# Autor: Marcelo César Martinez
# Me gustan los emojis 🐳
# Mi almuerzo: https://buymeacoffee.com/martinezmakp
# Fecha: 20-08-2025
# Uso en root: ./docker-repo.sh

set -euo pipefail

echo "Actualizando lista de paquetes."
apt-get update

echo "Instalando dependencias necesarias."
apt-get install -y ca-certificates curl gnupg

echo "Creando directorio seguro para llaves GPG."
install -m 0755 -d /etc/apt/keyrings

echo "Descargando y almacenando la llave GPG de Docker."
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo "Configurando el repositorio oficial de Docker..."
ARCH=$(dpkg --print-architecture)
CODENAME=$(source /etc/os-release && echo "$VERSION_CODENAME")

echo "deb [arch=${ARCH} signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian ${CODENAME} stable" \
  > /etc/apt/sources.list.d/docker.list

echo "Actualizando lista de paquetes con el nuevo repositorio..."
apt-get update

echo "Repositorio de Docker agregado correctamente."