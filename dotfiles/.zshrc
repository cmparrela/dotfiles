# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Source
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/asdf/libexec/asdf.sh

# Which plugins would you like to load?
plugins=(git zsh-autosuggestions zsh-syntax-highlighting asdf)

# User configuration

# Alias
alias vrc="code ~/.zshrc"
alias reloadrc="source ~/.zshrc"
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"' # listagem simples dos containers que estão sendo executados


#ASDF
# . /opt/homebrew/opt/asdf/libexec/asdf.sh

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx`
export PATH="$PATH:/Users/cristopherparrela/.local/bin"

