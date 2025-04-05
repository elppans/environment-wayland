#!/bin/bash

# Lista de arquivos comuns de configuração de shell
CONFIG_FILES=(".bash_profile" ".zshrc" ".profile" ".kshrc" ".cshrc" ".config/fish/config.fish")

# Diretório HOME do usuário
HOME_DIR="$HOME"

# Arquivo do script que será adicionado
SCRIPT_PATH="/usr/local/bin/environment-wayland"

# Lista para armazenar os arquivos que foram modificados
MODIFIED_FILES=()

# Copia o arquivo para /usr/local/bin e dá permissão de execução
if [ -f "environment-wayland" ]; then
    sudo cp environment-wayland "$SCRIPT_PATH"
    sudo chmod +x "$SCRIPT_PATH"
    echo "Arquivo environment-wayland copiado para $SCRIPT_PATH e permissões ajustadas"
fi

# Função para determinar qual linha adicionar
get_line_for_shell() {
    local file="$1"
    if [[ "$file" == "$HOME_DIR/.config/fish/config.fish" ]]; then
        echo "source $SCRIPT_PATH"
    else
        echo ". $SCRIPT_PATH"
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
            MODIFIED_FILES+=("$file")
            echo "Linha adicionada em $file"
        else
            echo "Linha já existe em $file"
        fi
    fi
}

# Se o usuário usa Bash, adiciona em .bash_profile ou .bashrc se necessário
if [ -f "$HOME_DIR/.bash_profile" ]; then
    add_line_if_not_exists "$HOME_DIR/.bash_profile"
else
    add_line_if_not_exists "$HOME_DIR/.bashrc"
fi

# Verifica e adiciona em todos os outros arquivos encontrados
for file in "${CONFIG_FILES[@]}"; do
    if [ -f "$HOME_DIR/$file" ]; then
        add_line_if_not_exists "$HOME_DIR/$file"
    fi
done

# Exibe mensagem final com os arquivos modificados
echo "Configuração concluída! As seguintes configurações foram atualizadas:"
printf '%s\n' "${MODIFIED_FILES[@]}"
