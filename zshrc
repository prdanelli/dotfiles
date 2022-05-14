################################################################################
# General configuration
################################################################################

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Persist history
HISTFILE=${ZDOTDIR:-$HOME}/.config/zsh/history

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Import Oh My ZSH
source $ZSH/oh-my-zsh.sh

################################################################################
# User configuration
################################################################################

# Which plugins would you like to load?
plugins=(asdf colored-man-pages git rails ripgrep tmux vi-mode)

# Imports
[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
[ -f ~/.config/zsh/olio_aws.sh ] && source ~/.config/zsh/olio_aws.sh # Don't commit secrets

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

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias ls="exa"
alias vim="nvim"
alias rspec="bundle exec rspec"
alias lazygit="lazygit -ucd ~/.config/lazygit/"
alias grep="grep --color=auto"
alias cat="bat $*"

# Additions to the PATH
export PATH=~/.cargo/bin/:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=/usr/local/bin:$PATH # Recommended by brew doctor
export PATH=$(brew --prefix python):$PATH
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/ # Fix for MySQL2 gem not compiling
export PATH=$(brew --prefix openssl):$PATH
export PATH=$(brew --prefix yarn):$PATH
export PATH=./bin:$PATH
export PATH=$(yarn global bin):$PATH

# Use Starship prompt
eval "$(starship init zsh)"

