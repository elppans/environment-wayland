#!/bin/bash

# Caminho do script que será adicionado
LINE=". /usr/local/bin/environment-wayland"

# Lista de arquivos comuns de configuração de shell
CONFIG_FILES=(".bash_profile" ".bashrc" ".zshrc" ".profile" ".kshrc" ".cshrc")

# Diretório HOME do usuário
HOME_DIR="$HOME"

# Copia o arquivo para /usr/local/bin e dá permissão de execução
if [ -f "environment-wayland" ]; then
    sudo cp environment-wayland /usr/local/bin/
    sudo chmod +x /usr/local/bin/environment-wayland
    echo "Arquivo environment-wayland copiado para /usr/local/bin e permissões ajustadas"
fi

# Função para adicionar a linha se ainda não estiver presente
add_line_if_not_exists() {
    local file="$1"
    if [ -f "$file" ]; then
        if ! grep -Fxq "$LINE" "$file"; then
            echo "$LINE" >> "$file"
            echo "Linha adicionada em $file"
        else
            echo "Linha já existe em $file"
        fi
    fi
}

# Verifica e adiciona no primeiro arquivo encontrado
for file in "${CONFIG_FILES[@]}"; do
    if [ -f "$HOME_DIR/$file" ]; then
        add_line_if_not_exists "$HOME_DIR/$file"
        exit 0
    fi
done

# Se nenhum arquivo for encontrado, cria o .bashrc e adiciona a linha
DEFAULT_FILE="$HOME_DIR/.bashrc"
echo "$LINE" >> "$DEFAULT_FILE"
echo "Arquivo $DEFAULT_FILE criado e linha adicionada"
