source ~/.config/fish/alias.fish

function unset
    set --erase $argv
end

function ls
    command exa $argv
end

function starship:edit
    command vim ~/.config/starship.toml
end

function kitty:edit
    command vim ~/.config/kitty/kitty.conf
end

function git:edit
    command vim ~/.gitconfig
end

function tmux:edit
    command vim ~/.tmux.conf
end

function vim:edit
   command vim ~/.vim/config.vim
end

function dory:edit
    command vim ~/.dory.yml
end

function dory:start
    command dory up
end

function dory:stop
    command dory stop
end

function solr:start
    systemctl start solr
end

function solr:stop
    systemctl stop solr
end

function solr:status
   systemctl status solr
end

function dc
    command docker-compose $argv
end

function dce
    command docker-compose exec $argv
end

function bldc
    command docker-compose -f docker/docker-compose.dev.yml $argv
end

function tmux:reload
    command tmux source-file ~/.tmux.conf
end

function colours
    bash -c 'for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
    done'
end

function fish:history
    vim ~/.config/fish/fish_history
end

function fish:edit
    vim ~/.config/fish/config.fish
end

function fish:config
    vim ~/.config/fish/config.fish
end

function fish:reload
    source ~/.config/fish/config.fish
end

set -gx PATH /home/paul/Personal/dotfiles/diff-so-fancy /usr/local/bin ~/local/bin $PATH
set -xU FZF_DEFAULT_COMMAND 'rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
set -gx EDITOR 'vim'

set fish_greeting ""

# Load all saved ssh keys
/usr/bin/ssh-add -A ^/dev/null

# Set Bat theme, which is used for Vim FZF previews
set -gx BAT_THEME Nord

# Install Starship
starship init fish | source

rvm default

