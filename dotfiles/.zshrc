# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"

# Source
source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc-private
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Which plugins would you like to load?
plugins=(git zsh-autosuggestions zsh-syntax-highlighting asdf)

# Alias
alias vrc="code ~/.zshrc"
alias vrcp="code ~/.zshrc-private"
alias reloadrc="source ~/.zshrc"
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias k=kubectl
alias set-k8s-dev="kubectl config use-context dev"
alias set-k8s-prod="kubectl config use-context prod"

# Plugin fzf necessary to work command + r
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ajuste para o asdf
source /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="$HOME/.asdf/shims:$PATH"
GOPATH=$(go env GOPATH)
export PATH="$GOPATH/bin:$PATH"

# Kubernetes
# source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

#JDK
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Postgres
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"