################################################################################
# General configuration
################################################################################

DISABLE_AUTO_TITLE="true" # Disable auto-setting terminal title.
COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion.
DISABLE_UNTRACKED_FILES_DIRTY="true" # Disable marking untracked files
INC_APPEND_HISTORY="true"
SAVEHIST=10000
HISTFILE=${ZDOTDIR:-$HOME}/history # Persist history

################################################################################
# Imports
################################################################################

[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
[ -f ~/.config/zsh/olio_aws.sh ] && source ~/.config/zsh/olio_aws.sh # Don't commit secrets

################################################################################
# User configuration
################################################################################

# Disable highlight of pastes text
zle_highlight=('paste:none')

# Enabled features
setopt autocd extendedglob nomatch menucomplete

# Unset defaults
unsetopt correct_all BEEP

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Disable homebrew post-install messages
export HOMEBREW_NO_ENV_HINTS=1

# Preferred editor
export EDITOR='nvim'

# Command Completions
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit && compinit
_comp_options+=(globdots)

# Colors
autoload -Uz colors && colors

################################################################################
# Aliases
################################################################################

alias zshsource="source $ZDOTDIR/.zshrc"
alias zshconfig="nvim $ZDOTDIR/.zshrc"
alias ls="exa $*"
alias vim="nvim $*"
alias rspec="bundle exec rspec $*"
alias lazygit="lazygit -ucd ~/.config/lazygit/"
alias grep="grep --color=auto $*"
alias cat="bat $*"

################################################################################
# Additions to the PATH
################################################################################

export PATH=/opt/homebrew/bin:$PATH # Brew is first as everything else uses that
export PATH=/usr/local/bin:$PATH # Recommended by brew doctor
export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=/opt/homebrew/opt/python@3.9:$PATH
export PATH=/opt/homebrew/opt/openssl@3:$PATH
export PATH=/opt/homebrew/opt/yarn:$PATH
# export PATH=$(yarn global bin):$PATH
export PATH=./bin:$PATH # Rails binstubs

export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/opt/zstd/lib/ # Fix for MySQL2 gem not compiling

# # Use Starship prompt
eval "$(starship init zsh)"
#
