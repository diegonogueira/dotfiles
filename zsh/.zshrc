# ======================================
# ============== BASIC =================
# ======================================

unset MAILCHECK

export LC_ALL=en_US.UTF-8
export EDITOR='nvim'
export TERM="xterm-256color"
export PATH=~/.local/bin:$PATH

# ======================================
# ============== ZSH ===================
# ======================================

export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="my"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# bind k and j for VI mode
bindkey -M vicmd 'j' history-substring-search-up
bindkey -M vicmd 'k' history-substring-search-down

# ======================================
# ============== ASDF ==================
# ======================================

 . $HOME/.asdf/asdf.sh
export ERL_AFLAGS="-kernel shell_history enabled"

# ======================================
# ============== JAVA ==================
# ======================================

# export _JAVA_OPTIONS='-Xms256m -Xmx256m'
# export ES_JAVA_OPTS='-Xms256m -Xmx256m'
export ES_JAVA_OPTS='-Xms1g -Xmx1g'