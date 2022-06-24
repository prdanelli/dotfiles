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

alias skhdkeys="bat ~/.config/skhd/skhdrc"
alias editdots="cd ~/Personal/Repos/dotfiles; nvim"
alias brewbundle="brew bundle --file ~/.Brewfile"

# ZSH
alias zshsource="source $ZDOTDIR/.zshrc"
alias zshedit="nvim $ZDOTDIR/.zshrc"
alias zshalias="cat ~/.config/zsh/config/aliases.sh"

# Tmux
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
