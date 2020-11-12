source $HOME/.zsh.d/.oh-my-zshrc
unset MAILCHECK # disable "you have mail" warning

# ======================================
# ============= Alias ==================
# ======================================

alias ll="ls -Glahs"
alias ls="/bin/ls -G"
alias psgrep="ps aux | egrep -v egrep | egrep"
alias internal_ip="ipconfig getifaddr en0"
alias myip='export IP=`curl -s https://api.ipify.org`;echo $IP'

alias ga="git log --graph"
alias gs="git status"
alias gp="git push"
alias gf="git fetch origin -p"
alias gl="git log --graph"
alias gpr="git pull --rebase"
alias gca="git commit --ammend" # rename commit
alias grh="git reset --hard" # move branch to point
alias gffs="git flow feature start"
alias gffp="git flow feature publish"
alias gfff="git flow feature finish"
alias gfft="git flow feature track"
alias gfhs="git flow hotfix start"
alias gfhp="git flow hotfix publish"
alias gfhf="git flow hotfix finish"
alias gfht="git flow hotfix track"

alias mt="mix test"
alias mps="mix phx.server"
alias iexm="iex -S mix"

alias es="ember server"

# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#   alias ga="gitk --all"
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#   alias ga="fork"
# fi

# ======================================
# ============ Exports =================
# ======================================

# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#   export PATH="$PATH:$HOME/flutter/bin"
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#   export PATH="$PATH:$HOME/flutter/bin"
# fi

# ======================================
# ============== ASDF ==================
# ======================================

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export LC_ALL=en_US.UTF-8
export EDITOR='vim'
export TERM="xterm-256color"

# ======================================
# ============== JAVA ==================
# ======================================

# if [[ -d "/usr/lib/jvm/java-8-openjdk-amd64" ]]; then
#   export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
# fi

# if [[ -d "/usr/lib/jvm/java-11-openjdk-amd64" ]]; then
#   export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
# fi

# export ANDROID_HOME=~/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
# export PATH=$PATH:$ANDROID_HOME/emulator

. ~/.asdf/plugins/java/set-java-home.zsh

# ======================================
# =============== FZF ==================
# ======================================

if [[ -f "/usr/share/doc/fzf/examples/key-bindings.zsh" ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [[ -f "/usr/share/doc/fzf/examples/key-bindings.zsh" ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [[ -f "/usr/share/fzf/key-bindings.zsh" ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source ~/.config/tmuxinator/tmuxinator.zsh

# WSL2 configurations

# export $(dbus-launch)
# export LIBGL_ALWAYS_INDIRECT=1
# export WSL_VERSION=$(wsl.exe -l -v | grep -a '[*]' | sed 's/[^0-9]*//g')
# export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
# # export ADB_SERVER_SOCKET=tcp:$WSL_HOST:5037
# export DISPLAY=$WSL_HOST:0
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0