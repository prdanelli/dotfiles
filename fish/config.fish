source ~/.config/fish/alias.fish

function spicetify:apply
  command spicetify config current_theme $argv; spicetify apply
end

function cclip
	xclip -selection clipboard
end

function mkfile
	mkdir -p (dirname $argv) && touch $argv
end

function unset
    set --erase $argv
end

function ls
    command exa $argv
end

function starship:edit
    command nvim ~/.config/starship.toml
end

function kitty:edit
    command nvim ~/.config/kitty/kitty.conf
end

function git:edit
    command nvim ~/.gitconfig
end

function dc
    command docker-compose $argv
end

function dce
    command docker-compose exec $argv
end

function dce:web:bash
    command docker-compose exec web bash
end

function dce:web:console
    command docker-compose exec web bundle exec rails console
end

function dce:web:rspec
    command docker-compose exec web bundle exec rspec $argv
end

function dce:web:rubocop
    command docker-compose exec web bundle exec rubocop -a
end

function dce:web:rails
	command docker-compose exec web bundle exec rails $argv
end

function dce:web:install
	command docker-compose exec web bundle exec rails g hyku_addons:install
end

function dce:web:attach
	command docker-compose up -d web workers; docker attach hyku_addons_web_1
end

function gcloud:deploy:ah
	bash -c "gcloud config configurations activate ubiquityrepo-ah; gcloud container clusters get-credentials cluster-ah --zone europe-west4-a;"
	bash -c "helm repo update; helm upgrade hyku ubiquity-charts-hyku/hyku"
end

function gcloud:deploy:us
	bash -c "gcloud config configurations activate ubiquityrepo-us; gcloud container clusters get-credentials cluster-us --zone us-central1-a;"
	bash -c "helm repo update; helm upgrade hyku ubiquity-charts-hyku/hyku"
end

function gcloud:hyku:bash
	kubectl exec -it (gcloud:hyku:pod) -- /bin/bash
end

function gcloud:hyku:pod
	gcloud:hyku:pods | head -n 1 | awk '{print $1;}'
end

function gcloud:hyku:pods
	kubectl get pods | grep hyku
end

function ha:rspec
	bash -c 'bundle exec rspec `find spec -name "*_spec.rb" | grep -v internal_test_hyrax`'
end

function tmux:edit
    command nvim ~/.tmux.conf
end

function colours
    bash -c 'for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
    done'
end

function fish:history
    nvim ~/.config/fish/fish_history
end

function fish:edit
    nvim ~/.config/fish/config.fish
end

function fish:config
    nvim ~/.config/fish/config.fish
end

function fish:reload
    source ~/.config/fish/config.fish
end

set -gx PATH ~/Personal/dotfiles/diff-so-fancy /usr/local/bin /usr/local/go/bin ~/local/bin ~/.gem/ruby/2.7.0/bin $PATH
set -xU FZF_DEFAULT_COMMAND 'rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
set -gx EDITOR 'nvim'
set -gx GTK_THEME 'NordNautilusGTK:gtk-dark'

set fish_greeting ""

# Ensure we start the auth daemon as bspwm doesn't seem to do this automatically
if test -n "$DESKTOP_SESSION"
    set -x (gnome-keyring-daemon --start | string split "=")
end

# Set Bat theme, which is used for Vim FZF previews
set -gx BAT_THEME base16

# Install Starship
starship init fish | source

rvm default

