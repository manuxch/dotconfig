# ==============================================================================
# 1. CONFIGURACIÓN CENTRAL DE OH MY ZSH & PATHS
# ==============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Comportamiento y actualizaciones
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

# PLUGINS (Definidos estrictamente ANTES de cargar Oh My Zsh)
# Nota: 'zsh-syntax-highlighting' siempre debe ser el último de la lista.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Inicializar Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ==============================================================================
# 2. VARIABLES DE ENTORNO & EXPORTS (PATH)
# ==============================================================================
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/ovito-basic-3.12.4-x86_64/bin"

# Editor preferido según el entorno
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

# ==============================================================================
# 3. CONFIGURACIÓN DEL HISTORIAL (Optimizada para Zsh)
# ==============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt share_history # Comparte el historial entre pestañas activas en tiempo real

# ==============================================================================
# 4. CONFIGURACIÓN DE FZF (Integración nativa y limpia)
# ==============================================================================
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

# ==============================================================================
# 5. ALIASES PERSONALIZADOS (Organizados por categoría)
# ==============================================================================

# --- Conexiones e Investigación (IFLYSIB / UTN / SLURM / VPN) ---
alias iy='ssh -p22 manuel@10.100.0.145'
alias sutn='ssh mcarlevaro@10.2.2.4'
alias slurm='ssh mcarlevaro@10.100.0.202'
alias vpn='cd /home/manuel/tools/mcarlevaro && sudo openvpn client.conf'
alias utn='cd /home/manuel/tools/mcarlevaro && sudo openvpn mcarlevaro.ovpn'
alias cam='nohup mpv rtsp://admin:1234qwer@192.168.1.37 &>/dev/null &'

# --- Reemplazos Modernos (lsd / Gestión de archivos) ---
alias ls='lsd'
alias l='ls -ah'
alias la='ls -afh'            # Vista compacta mostrando ocultos
alias ll='ls -alh'            # Vista de lista detallada con ocultos
alias l1='ls -1h'
alias lf='ls -fh'
alias labc='ls -- -p -lap'     # Orden alfabético
alias lf="ls -lh | egrep -v '^d'"  # Solo archivos
alias ldir="ls -l | egrep '^d'"    # Solo directorios
alias latr="ls -latrh"         # Ordenados por antigüedad (reverso)
alias sl=ls

# --- Navegación y Utilidades básicas ---
alias bd='cd "$oldpwd"'
alias c='clear'
alias da='date "+%y-%m-%d %a %t %z"'
alias meteo='curl wttr.in'
alias rmd='/bin/rm --recursive --force --verbose'

# --- Búsquedas y Procesos (Filtros rápidos) ---
alias h="history | grep "
alias p="ps aux | grep "
alias f="find . | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
alias checkcommand="type -t"

# --- Inspección de Almacenamiento e Información del Sistema ---
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"
alias diskspace="du -s | sort -n -r | more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -cahf --dirsfirst'
alias treed='tree -cafd'
alias mountedinfo='df -ht'

# --- Administración del Sistema (Debian Testing) ---
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
alias aptupgd='sudo apt update && sudo apt dist-upgrade -v && sudo apt autoremove'
