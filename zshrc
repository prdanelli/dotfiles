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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse asdf)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf ruby rails)

# Persist history
HISTFILE=${ZDOTDIR:-$HOME}/.config/zsh/history

# Auto CD into directories without `cd`
setopt AUTO_CD

# User configuration
#
# Worlds most annoying feature!
unsetopt correct_all

source ~/.asdf/asdf.sh

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Disable homebrew post-install messages
export HOMEBREW_NO_ENV_HINTS=1

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

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

# Additions to the PATH
export PATH=~/.cargo/bin/:$PATH
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH" # Recommended by brew doctor
export PATH=$(brew --prefix python):$PATH
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/ # Fix for MySQL2 gem not compiling
export PATH=$(brew --prefix openssl):$PATH
export PATH=$(brew --prefix yarn):$PATH
export PATH=./bin:$PATH
export PATH="$(yarn global bin):$PATH"

eval "$(starship init zsh)"
