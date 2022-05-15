################################################################################
# ZSH configuration
################################################################################

DISABLE_AUTO_TITLE="true" # Disable auto-setting terminal title.
COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion.
DISABLE_UNTRACKED_FILES_DIRTY="true" # Disable marking untracked files
INC_APPEND_HISTORY="true"
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history # Persist history
HISTSIZE=1000000
SAVEHIST=1000000

setopt appendhistory

# Disable highlight of pastes text
zle_highlight=('paste:none')

# Enabled features
setopt autocd extendedglob nomatch menucomplete interactive_comments

# Disable ctrl-s to freeze terminal.
stty stop undef

# Unset defaults
unsetopt correct_all BEEP

# Colors
autoload -Uz colors && colors


################################################################################
# Plugins and packages
################################################################################

source "$ZDOTDIR/user/packages.sh"

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

zsh_add_config "config/exports.sh"
zsh_add_config "config/aliases.sh"
zsh_add_config "config/vim-mode.sh"

################################################################################
# Imports
################################################################################

zsh_add_file "$HOME/.asdf/asdf.sh"
zsh_add_file "$HOME/.config/zsh/olio_aws.sh" # Don't commit secrets

################################################################################
# Command Completions
################################################################################

autoload -Uz compinit
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' menu select
zmodload zsh/complist

# Include hidden files
_comp_options+=(globdots)

compinit

################################################################################
# Prompt
################################################################################

eval "$(starship init zsh)"

