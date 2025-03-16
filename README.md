# environment_wayland
___

Repositório para armazenar e gerenciar configurações de ambiente para sessões **Wayland**, com suporte para **KDE Plasma**, **Gnome**, **NVidia**, **AMD** e máquinas virtuais (**QEMU/KVM**, **VMWare**, **VirtualBox**). Este arquivo contém variáveis de ambiente e configurações otimizadas para melhorar o desempenho e a compatibilidade em diferentes ambientes gráficos e virtualizados.

---

## O que é este repositório?

Este repositório contém um arquivo chamado `environment` que define variáveis de ambiente para:

- **Sessões Wayland**: Configurações específicas para KDE Plasma e Gnome no Wayland.
- **Drivers de GPU**: Otimizações para NVidia e AMD.
- **Máquinas virtuais**: Configurações para QEMU/KVM, VMWare e VirtualBox.
- **Aplicativos**: Configurações para melhorar a compatibilidade de aplicativos como Firefox.

O objetivo é centralizar e facilitar o gerenciamento dessas configurações, permitindo que você as use em diferentes máquinas ou compartilhe com outras pessoas.

---

## Para que serve?

As variáveis de ambiente definidas neste repositório servem para:

1. **Otimizar o desempenho gráfico**: Ajustar configurações para GPUs NVidia e AMD.
2. **Melhorar a compatibilidade**: Resolver problemas comuns em sessões Wayland e máquinas virtuais.
3. **Facilitar a configuração**: Centralizar todas as configurações em um único arquivo.
4. **Compatibilidade com aplicativos**: Garantir que aplicativos como Firefox funcionem corretamente no Wayland.

---

## Como usar?

### 1. Clonar o repositório

Primeiro, clone o repositório para o seu sistema:

```bash
git clone https://github.com/elppans/environment_wayland.git
cd environment_wayland
```

### 2. Carregar as variáveis de ambiente

Você pode carregar as variáveis de ambiente manualmente para a sessão atual:

```bash
source environment
```

Isso aplicará as configurações apenas para a sessão atual do terminal.

### 3. (Opcional) Carregar automaticamente ao iniciar o sistema

Se você quiser que as variáveis sejam carregadas automaticamente ao iniciar uma sessão do shell, adicione a linha abaixo ao final do seu `.bashrc`, `.zshrc` ou `.profile`:

```bash
# Carregar variáveis de ambiente do repositório
source /caminho/para/environment_wayland/environment
```

Substitua `/caminho/para/environment_wayland/` pelo caminho completo onde o repositório foi clonado.

### 4. Verificar as variáveis carregadas

Para confirmar que as variáveis foram carregadas corretamente, você pode usar o comando `printenv`:

```bash
printenv | grep QT_  # Exemplo: Verificar variáveis relacionadas ao Qt
```
---

## Configurações Disponíveis

### Sessões Wayland
- Configurações para **KDE Plasma** e **Gnome** no Wayland.
- Desativação do VSync para melhorar o desempenho.

### Drivers de GPU
- **NVidia**: Configurações para otimizar o desempenho e evitar bugs.
- **AMD**: Configurações para melhorar a compatibilidade com Wayland.

### Máquinas Virtuais
- **QEMU/KVM**: Configurações para áudio (PipeWire/PulseAudio) e gráficos (QXL/SPICE).
- **VMWare**: Ajustes para melhorar a integração gráfica.
- **VirtualBox**: Configurações para aceleração gráfica e suporte a 3D.

### Aplicativos
- **Firefox**: Habilitar suporte ao Wayland.

---
