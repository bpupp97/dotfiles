# Lines configured by zsh-newuser-install
HISTFILE=~/.zhist
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd nomatch
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/brandon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT="%2d » "

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias Suspend="systemctl suspend"
alias Reboot="reboot"
alias Shutdown="shutdown -h now"
alias msploit="sudo -E ~/git/metasploit-framework/msfconsole"

# Vimpager
export PAGER=/usr/bin/vimpager
alias less=$PAGER
alias zless=$PAGER

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# export GEM_HOME=$(ruby -e 'print Gem.user_dir')
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


