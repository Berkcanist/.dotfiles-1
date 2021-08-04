[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zplug/init.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f .aliases ] && source .aliases
[ -f .env ] && source .env
autoload -Uz compinit promptinit
compinit
promptinit
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=20
setopt appendhistory


neofetch

add_sudo (){
prefix="sudo"
BUFFER="$prefix $BUFFER"
CURSOR=$(($CURSOR + $#prefix + 1))
}
zle -N add_sudo
bindkey "^[s" add_sudo

zplug "dracula/zsh", as:theme
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git",   from:oh-my-zsh
zplug "marlonrichert/zsh-autocomplete"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load 
