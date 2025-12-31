# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup git for the prompt 
export GIT_PS1_SHOWDIRTYSTATE=1
source ~/dotfiles/git-prompt.sh

# Aliases
source ~/dotfiles/bash/bash_aliases.bash

# Config
source ~/dotfiles/bash/bash_config.bash

# Prompt
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[95;3m\]\w\[\e[0m\]${PS1_CMD1}\n\[\e[96m\]->\[\e[0m\]\\$ '
