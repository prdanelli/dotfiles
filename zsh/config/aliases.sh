################################################################################
# Aliases
#
# To remove an alias: `unalias `
################################################################################

# General
alias ls="exa -s type "
alias la="ls -la"
alias vim="nvim"
alias rspec="bundle exec rspec"
alias lazygit="lazygit -ucd ~/.config/lazygit/"
alias grep="grep --color=auto"
alias cat="bat"

alias editdots="cd ~/Personal/Repos/dotfiles; nvim"
alias brewbundle="brew bundle --file ~/.Brewfile"


# ZSH
alias zsh:source="source $ZDOTDIR/.zshrc"
alias zsh:edit="nvim $ZDOTDIR/.zshrc"
alias zsh:alias="cat ~/.config/zsh/config/aliases.sh"

# Tmux
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# Olio
alias olio:storage="zsh ~/Dev/storage.sh"

# Yabai / SKHD
alias yabai:restart="brew services restart yabai"
alias yabai:borders:off="yabai -m config window_border off"
alias yabai:borders:on="yabai -m config window_border on"
alias skhd:keys="bat ~/.config/skhd/skhdrc"
