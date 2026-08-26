# ~/.bashrc

# Set some default environment variables

export EDITOR=vim
export VISUAL=vim
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTTIMEFORMAT="%F %T "
export KICAD_CONFIG_HOME=/mnt/nas/kicad/config
export KICAD_DOCUMENTS_HOME=/mnt/nas/kicad/docs

# Used for Setup. Empty file if done
if [ -f "$HOME/.config/env/setup.sh" ]; then
    . "$HOME/.config/env/setup.sh"
fi

# Color prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
  PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w \$\[\e[0m\] '
fi

# Add custom bin directory to PATH
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# Source aliases and functions
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_functions ] && source ~/.bash_functions

# Enable programmable completion features (if not already enabled)
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

PROMPT_COMMAND='echo -ne "\033]0;${USER}@$(hostname): $(hostname -I | awk "{print \$1}")\007"'

