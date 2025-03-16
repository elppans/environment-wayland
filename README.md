# environment_wayland

---

Repositório para armazenar e gerenciar configurações de ambiente para sessões **Wayland**, com suporte para **KDE Plasma**, **Gnome**, **NVidia**, **AMD** e máquinas virtuais (**QEMU/KVM**, **VMWare**, **VirtualBox**). Este repositório contém um script que define variáveis de ambiente otimizadas para melhorar o desempenho e a compatibilidade em diferentes ambientes gráficos e virtualizados.

---

## O que é este repositório?

Este repositório contém um script chamado `environment.sh` que define variáveis de ambiente para:

- **Sessões Wayland**: Configurações específicas para KDE Plasma e Gnome no Wayland.
- **Drivers de GPU**: Otimizações para NVidia e AMD.
- **Máquinas virtuais**: Configurações para QEMU/KVM, VMWare e VirtualBox.
- **Aplicativos**: Configurações para melhorar a compatibilidade de aplicativos como Firefox.

O script é projetado para ser carregado automaticamente durante o boot do sistema, aplicando as configurações necessárias com base no ambiente detectado (GPU, ambiente gráfico, virtualização, etc.).

---

## Para que serve?

O script `environment.sh` serve para:

1. **Otimizar o desempenho gráfico**: Ajustar configurações para GPUs NVidia e AMD.
2. **Melhorar a compatibilidade**: Resolver problemas comuns em sessões Wayland e máquinas virtuais.
3. **Facilitar a configuração**: Centralizar todas as configurações em um único script.
4. **Compatibilidade com aplicativos**: Garantir que aplicativos como Firefox funcionem corretamente no Wayland.
5. **Configuração automática**: As variáveis de ambiente são carregadas automaticamente durante o boot, sem necessidade de intervenção manual.

---

## Como usar?

### 1. Clonar o repositório

Primeiro, clone o repositório para o seu sistema:

```bash
git clone https://github.com/elppans/environment_wayland.git
cd environment_wayland
```

### 2. Instalar o script no sistema

Para que as variáveis de ambiente sejam carregadas automaticamente durante o boot, mova o script `environment.sh` para o diretório `/etc/profile.d/`:

```bash
sudo cp environment.sh /etc/profile.d/
```
```bash
sudo chmod +x /etc/profile.d/environment.sh
```
Isso garantirá que o script seja executado automaticamente ao iniciar uma sessão de usuário.

### 3. (Opcional) Verificar as variáveis carregadas

Para confirmar que as variáveis foram carregadas corretamente, você pode usar o comando `printenv` após reiniciar o sistema ou iniciar uma nova sessão:

```bash
printenv | grep QT_  # Exemplo: Verificar variáveis relacionadas ao Qt
```

### 4. (Opcional) Carregar manualmente para a sessão atual

Se você quiser carregar as variáveis manualmente para a sessão atual (sem reiniciar), execute:

```bash
source /etc/profile.d/environment.sh
```

---

## Como o script funciona?

O script `environment.sh` detecta automaticamente:

1. **Se o sistema está em uma máquina virtual (VM)**:
   - Detecta o hypervisor (QEMU/KVM, VMWare, VirtualBox) e aplica configurações específicas.
   - Configura a renderização por software, se necessário, para melhorar a compatibilidade em VMs.

2. **Se o sistema usa NVIDIA ou AMD**:
   - Aplica configurações otimizadas para a GPU detectada.
   - Configura variáveis como `NV_PRIME_RENDER_OFFLOAD` para NVIDIA ou `GBM_BACKEND=radeonsi` para AMD.

3. **O ambiente gráfico em uso (KDE Plasma ou GNOME)**:
   - Aplica configurações específicas para o ambiente gráfico detectado.
   - Configura variáveis como `KWIN_DRM_FORM_EGL_STREAMS` para Plasma ou `GDK_BACKEND=wayland` para GNOME.

4. **Configurações gerais para Wayland**:
   - Define variáveis como `MOZ_ENABLE_WAYLAND=1` para garantir que aplicativos como Firefox funcionem corretamente no Wayland.

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

## Estrutura do Script

O script `environment.sh` é dividido em seções que detectam e configuram:

1. **Detecção de VM**:
   - Usa `systemd-detect-virt`, `lscpu` ou `/proc/cpuinfo` para identificar o hypervisor.

2. **Detecção de GPU**:
   - Verifica a presença do comando `nvidia-smi` para detectar NVIDIA.
   - Configura variáveis específicas para NVIDIA ou AMD.

3. **Detecção do ambiente gráfico**:
   - Verifica a variável `XDG_CURRENT_DESKTOP` para identificar KDE Plasma ou GNOME.

4. **Configurações gerais**:
   - Aplica variáveis de ambiente que são comuns a todos os sistemas, como `MOZ_ENABLE_WAYLAND=1`.

---

## Contribuindo

Se você quiser contribuir com melhorias ou novas configurações, siga estas etapas:

1. Faça um fork deste repositório.
2. Crie uma branch para sua feature ou correção:
   ```bash
   git checkout -b minha-feature
   ```
3. Faça as alterações e commit:
   ```bash
   git commit -m "Adicionar nova configuração para XYZ"
   ```
4. Envie as alterações para o repositório remoto:
   ```bash
   git push origin minha-feature
   ```
5. Abra um pull request no GitHub.

---

## Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## Contato

Se você tiver dúvidas, sugestões ou problemas, sinta-se à vontade para abrir uma issue no repositório ou entrar em contato diretamente.

---
