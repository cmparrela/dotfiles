# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"

# Source
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/asdf/libexec/asdf.sh
source $HOME/.zshrc-private

# Which plugins would you like to load?
plugins=(git zsh-autosuggestions zsh-syntax-highlighting asdf)

# Alias
alias vrc="code ~/.zshrc"
alias vrcp="code ~/.zshrc-private"
alias reloadrc="source ~/.zshrc"
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx`
export PATH="$PATH:$HOME/.local/bin"

# Created by `gcp`
export PATH="$PATH:~/Downloads/google-cloud-sdk/bin/gcloud init"
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Plugin fzf necessary to work command + r
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

