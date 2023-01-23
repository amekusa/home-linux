#  shell environment variables
# ----------------------------- *

# default editor
export EDITOR=nano
export VISUAL=$EDITOR

# composer
export COMPOSER_HOME="$HOME/.composer"
PATH="$PATH:$COMPOSER_HOME/vendor/bin"

# node
if command -v npm &> /dev/null; then
	export NODE_PATH="$(npm root -g)"
	PATH="$PATH:$NODE_PATH/.bin"
fi

# rubygems
if command -v ruby &> /dev/null; then
	export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
	PATH="$PATH:$GEM_HOME/bin"
fi

# nextcloud
export NEXTCLOUD_PHP_CONFIG="/etc/webapps/nextcloud/php.ini"

# custom executables
PATH="$PATH:$HOME/.sh/scripts"

# export resulting path
export PATH
