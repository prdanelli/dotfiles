################################################################################
# Exported Variables
################################################################################

export PATH=/opt/homebrew/bin:$PATH # Brew is first as everything else uses that
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/usr/local/bin:$PATH # Recommended by brew doctor
export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=/opt/homebrew/opt/python@3.9:$PATH
export PATH=/opt/homebrew/opt/openssl@3:$PATH
export PATH=/opt/homebrew/opt/yarn:$PATH
# export PATH=$(yarn global bin):$PATH
export PATH=./bin:$PATH # Rails binstubs

export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/opt/zstd/lib/ # Fix for MySQL2 gem not compiling

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Disable homebrew post-install messages
export HOMEBREW_NO_ENV_HINTS=1

# Preferred programs
export EDITOR="nvim"
export TERMINAL="kitty"
export MANPAGER='nvim +Man!'
