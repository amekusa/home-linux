#  shell environment variables
# ----------------------------- ---- -- -

# default editor
export EDITOR=nano
export VISUAL=$EDITOR

# composer
export COMPOSER_HOME="$HOME/.composer"
PATH="$COMPOSER_HOME/vendor/bin:$PATH"

# node
export NODE_PATH="$(npm root -g)"
PATH="$NODE_PATH/.bin:$PATH"

# custom executables
PATH="$PATH:$HOME/.sh/bin"

# export resulting path
export PATH
