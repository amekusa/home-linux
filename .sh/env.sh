#  shell environment variables
# ----------------------------- ---- -- -

# default editor
export EDITOR=nano
export VISUAL=$EDITOR

# composer
export COMPOSER_HOME="$HOME/.composer"
PATH="./vendor/bin:$COMPOSER_HOME/vendor/bin:$PATH"

# node
export NODE_PATH="$(npm root -g)"
PATH="./node_modules/.bin:$NODE_PATH/.bin:$PATH"

# export resulting path
export PATH
