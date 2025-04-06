#!/bin/bash

# Caminho do script de ambiente
SOURCE_FILE="environment-wayland"
DEST_DIR="/etc/profile.d"
DEST_FILE="$DEST_DIR/environment-wayland.sh"

# Verifica se o arquivo existe antes de copiar
if [ -f "$SOURCE_FILE" ]; then
    # Copia o arquivo para /etc/profile.d e renomeia
    sudo cp "$SOURCE_FILE" "$DEST_FILE"
    sudo chmod +x "$DEST_FILE"

    echo "Arquivo de variáveis instalado"
else
    echo "Erro: Arquivo '$SOURCE_FILE' não encontrado!"
    exit 1
fi
