export ZSH="/Users/$(whoami)/.oh-my-zsh"
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# WHICH OS?
case $( uname -s ) in
Linux)
    OS="LINUX"
    ;;
Darwin)
    OS="MAC"
    ;;
esac

set -o vi

mvim='/Applications/MacVim.app/Contents/MacOS/Vim'
if test -f "$mvim"; then
  # Use macvim version of vim as default editor
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
fi

# Shell Aliases
alias ls='ls -lh'
alias la='ls -lha'

# Config shortcuts
alias vimrc="vim $HOME/.vimrc";
alias bashrc="vim $HOME/.zshrc && source $HOME/.zshrc";
alias bp="bashrc"
alias vrc="vimrc"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Directory Aliases
export DOCS="$HOME/Documents"
alias down="cd $HOME/Downloads";
alias desk="cd $HOME/Desktop"

# Project Directory Aliases
export PROJECTS="$DOCS/Projects"
alias p="cd $PROJECTS";
alias xf="p && cd xflow"

# General aliases
alias web="open -a 'Google Chrome'"
alias v="vim";
alias ta="tmux a"
alias ys="yarn start"
alias ep="vim package.json"
alias ch="code ."
alias sv="source ./venv/bin/activate"
alias h="history | fzf"
alias box="ssh root@104.248.170.122"
alias topcom="history |  cut -c7- | sort  | uniq -c | sort -nr | head -n 10"

# Kubernetes
alias k="kubectl"
alias kgp="k get po"
alias kgs="k get svc"

makegif()
{
  ffmpeg -i "$@" -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=15 > "$@".gif
}


# Unzipping *everything*
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Env
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=vim

# Path
export PATH=$HOME/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=$SCRIPTS:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH 
export PATH=$HOME/google-cloud-sdk/bin:$PATH
export PATH=/Users/$(whoami)/Library/Python/3.7/bin:$PATH
export PATH

# Various config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -e "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f '/Users/$(whoami)/google-cloud-sdk/path.zsh.inc' ] && . '/Users/$(whoami)/google-cloud-sdk/path.zsh.inc'
[ -f '/Users/$(whoami)/google-cloud-sdk/completion.zsh.inc' ] && . '/Users/$(whoami)/google-cloud-sdk/completion.zsh.inc'

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

function reset_trap {
  trap - INT
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec reset_trap
