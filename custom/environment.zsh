# zsh
unsetopt correct_all

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=HISTSIZE

export EDITOR=vim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Complete $PWD/.binstubs if it exists. Good for bundler with binstubs
zstyle -e ':completion:*' command-path '[[ -d $PWD/.binstubs ]] && reply=($PWD/.binstubs $path)'
