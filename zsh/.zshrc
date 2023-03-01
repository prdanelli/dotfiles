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

# Ensure no duplicates are recorded in the history
setopt HIST_IGNORE_ALL_DUPS

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
# Command Completions
################################################################################

autoload -Uz compinit
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zmodload zsh/complist

# Include hidden files
_comp_options+=(globdots)

compinit

################################################################################
# Plugins and packages
################################################################################

source "$ZDOTDIR/user/packages.sh"

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

zsh_add_config "config/exports.sh"
zsh_add_config "config/aliases.sh"
zsh_add_config "config/vim-mode.sh"
zsh_add_config "config/helpers.sh"

################################################################################
# Imports
################################################################################

zsh_add_file "$HOME/.asdf/asdf.sh"
zsh_add_file "$HOME/.config/zsh/secrets.sh" # Shhhh, don't commit secrets

################################################################################
# Key bindings
################################################################################

# History substring search keybings - normal mode
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Vim mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

################################################################################
# Misc
################################################################################

ssh-add -q --apple-use-keychain ~/.ssh/id_rsa # Ensure that the ssh_key is added to the ssh-agent

ulimit -Sn 10240 # Increase the default number of sockers (helps with rspec tests in Chrome)

################################################################################
# Prompt
################################################################################

eval "$(starship init zsh)"

macchina

if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
