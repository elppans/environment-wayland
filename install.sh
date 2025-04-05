#!/bin/bash

# Caminho do script que será adicionado
CONFIG_FILES=(".bash_profile" ".bashrc" ".zshrc" ".profile" ".kshrc" ".cshrc" ".config/fish/config.fish")

# Diretório HOME do usuário
HOME_DIR="$HOME"

# Copia o arquivo para /usr/local/bin e dá permissão de execução
if [ -f "environment-wayland" ]; then
    sudo cp environment-wayland /usr/local/bin/
    sudo chmod +x /usr/local/bin/environment-wayland
    echo "Arquivo environment-wayland copiado para /usr/local/bin e permissões ajustadas"
fi

# Função para determinar qual linha adicionar
get_line_for_shell() {
    local file="$1"
    if [[ "$file" == "$HOME_DIR/.config/fish/config.fish" ]]; then
        echo "source /usr/local/bin/environment-wayland"
    else
        echo ". /usr/local/bin/environment-wayland"
    fi
}

# Função para adicionar a linha se ainda não estiver presente
add_line_if_not_exists() {
    local file="$1"
    local line
    line=$(get_line_for_shell "$file")

    if [ -f "$file" ]; then
        if ! grep -Fxq "$line" "$file"; then
            echo "$line" >> "$file"
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
echo "$(get_line_for_shell "$DEFAULT_FILE")" >> "$DEFAULT_FILE"
echo "Arquivo $DEFAULT_FILE criado e linha adicionada"
