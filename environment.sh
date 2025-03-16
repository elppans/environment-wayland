# KDE Plasma (Wayland)
KWIN_DRM_FORM_EGL_STREAMS=1 # Melhora a compatibilidade com drivers EGL no Wayland
# KWIN_COMPOSE=0 # Desativado: causa problemas com Spectacle

# NVidia
QT_QPA_PLATFORMTHEME=qt6ct # Define o tema da plataforma Qt para qt6ct (customização de temas)
QT_IM_MODULE=ibus # Usar IBus como módulo de entrada para Qt (suporte a métodos de entrada)
QT_AUTO_SCREEN_SCALE_FACTOR=1 # Habilita o ajuste automático de escala para telas de alta resolução
__GL_SYNC_TO_VBLANK=0 # Desativa a sincronização vertical (VSync) para melhorar desempenho
NV_PRIME_RENDER_OFFLOAD=1 # Habilita o offload de renderização para GPUs NVidia (otimização para laptops)
__GL_ExperimentalPerfStrategy=1 # Habilita estratégias experimentais de desempenho da NVidia
QSG_RENDERER_LOOP=basic # Necessário para evitar alto uso de CPU (renderização básica)
# GBM_BACKEND=nvidia-drm # Comentado para evitar conflitos
# __GLX_VENDOR_LIBRARY_NAME=nvidia # NVidia 470.182.03-1+ não inicia login gráfico
VK_LAYER_NV_optimus=NVIDIA_only # Força o uso da GPU NVidia em sistemas com Optimus

# AMD
CLUTTER_BACKEND=wayland # Define o backend do Clutter como Wayland (para GPUs AMD)
SDL_VIDEODRIVER=wayland # Define o driver de vídeo SDL como Wayland (para GPUs AMD)
QT_QPA_PLATFORM=wayland # Define a plataforma Qt como Wayland (para GPUs AMD)
# Forçar o uso do renderizador glamor (para GPUs AMD)
GBM_BACKEND=radeonsi # Define o backend GBM como radeonsi (para GPUs AMD)
LIBGL_ALWAYS_SOFTWARE=0 # Desativa a renderização por software (usa hardware AMD)

# Gnome (Wayland)
GDK_BACKEND=wayland # Usar o Wayland puro (para aplicativos GTK)
__GL_SYNC_TO_VBLANK=0 # Desative o "Modo de Repouso" (VSync) para melhorar desempenho

# Configurações gerais
__GL_ExperimentalPerfStrategy=1 # Habilita estratégias experimentais de desempenho (geral)
__GL_MaxFramesAllowed=1 # Limita o número de quadros renderizados (otimização de desempenho)
GLX_SGI_video_sync=1 # Habilita sincronização de vídeo SGI (para OpenGL)
GLX_OML_sync_control=1 # Habilita controle de sincronização OML (para OpenGL)
MOZ_ENABLE_WAYLAND=1 # Para Firefox no Wayland (suporte nativo ao Wayland)

# Configurações gerais para máquinas virtuais
QSG_RENDER_LOOP=basic # Evitar problemas de renderização em ambientes virtuais (renderização básica)
QT_QPA_PLATFORM=xcb # Usar XCB como backend gráfico (mais estável em VMs)

# QEMU/KVM
QEMU_AUDIO_DRV=pa # Usar PipeWire (compatível com PulseAudio) (melhor compatibilidade)
QEMU_VGA=qxl # Usar driver QXL para gráficos (recomendado para SPICE)
SPICE_DEBUG_ALLOW_MC=1 # Permitir múltiplos clientes SPICE (para virtualização)
MESA_GL_VERSION_OVERRIDE=4.5 # Forçar versão do OpenGL (útil para compatibilidade)

# VMWare
VMWARE_USE_SHIPPED_GTK=1 # Usar GTK fornecido pelo VMWare (melhor integração)
SVGA_VGPU10=0 # Desativar aceleração 3D (útil para evitar bugs gráficos)
MESA_GL_VERSION_OVERRIDE=3.3 # Forçar versão do OpenGL (compatibilidade)

# VirtualBox
VBOX_GRAPHICS=1 # Habilitar aceleração gráfica (requer Guest Additions instalado)
VBOX_3D=1 # Habilitar suporte a 3D (requer Guest Additions e drivers corretos)
VBOX_VGA=std # Usar driver gráfico padrão (recomendado para compatibilidade)
MESA_GL_VERSION_OVERRIDE=3.1 # Forçar versão do OpenGL (compatibilidade)

# Usar a aceleração via Software em Máquinas Virtuais

# Forçar renderização por software
LIBGL_ALWAYS_SOFTWARE=1 # Forçar renderização por software (útil para compatibilidade)
GALLIUM_DRIVER=llvmpipe # Usar o driver Gallium LLVMpipe (renderização por software)
CLUTTER_PAINT=disable-clipped-redraws:disable-culling # Desativar otimizações de renderização no Clutter
CLUTTER_VBLANK=none # Desativar sincronização vertical no Clutter

# Configurações para Firefox
MOZ_ACCELERATED=0 # Desativar aceleração de hardware no Firefox (útil para evitar bugs)
MOZ_WEBRENDER=0 # Desativar o WebRender no Firefox (renderização por software)

# Configurações para Qt
QT_XCB_FORCE_SOFTWARE_OPENGL=1 # Forçar o uso de OpenGL por software no Qt (compatibilidade)

# Desativar aceleração de hardware no Gnome
GNOME_DISABLE_HW_ACCEL=1 # Desativar aceleração de hardware no Gnome (útil para evitar problemas gráficos)
