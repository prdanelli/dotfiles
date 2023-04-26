################################################################################
# Aliases
#
# To remove an alias: `unalias `
################################################################################

# General
alias ls="exa -s type "
alias la="ls -la"
alias lazygit="lazygit -ucd ~/.config/lazygit/"
alias grep="grep --color=auto"
alias cat="bat"
alias editdots="cd ~/Personal/Repos/dotfiles; nvim"

# Vim
alias vimdiff='nvim -d'
alias vim="nvim"

# Rails / Ruby
alias rspec="bundle exec rspec"

# ZSH
alias zsh:reload="source $ZDOTDIR/.zshrc"
alias zsh:edit="nvim $ZDOTDIR/.zshrc"
alias zsh:alias="cat ~/.config/zsh/config/aliases.sh"

# Tmux
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# Olio
alias olio:storage="zsh ~/Dev/storage.sh"
alias olio:stop_storage="docker stop redis-dev mysql-dev"

# Yabai
alias yabai:reload="brew services restart yabai"
alias yabai:start="brew services start yabai"
alias yabai:stop="brew services stop yabai"
alias yabai:install_sa="sudo yabai --load-sa"
alias yabai:borders:off="yabai -m config window_border off"
alias yabai:borders:on="yabai -m config window_border on"

# SKHD
alias skhd:keys="bat ~/.config/skhd/skhdrc"
alias skhd:reload="brew services restart skhd"

# Brew
# alias brew:upgrade:all="brew upgrade; brew remove nvim; brew install --HEAD nvim; nvim --headless '+Lazy! sync' +qa;"
alias brew:upgrade:all="brew upgrade; nvim --headless '+Lazy! sync' +qa;"
alias brewbundle="brew bundle --file ~/.Brewfile"

# Docker Compose
alias dc="docker-compose"
alias dcr="docker-compose run --rm"
function docker-attach() {
  docker attach $(docker-compose ps -q $1)
}


# ASDF
alias asdf:versions="nvim /Users/paul/.tool-versions"