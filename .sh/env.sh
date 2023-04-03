#  shell environment variables
# ----------------------------- *

# default editor
export EDITOR=nano
export VISUAL=$EDITOR

# nextcloud
export NEXTCLOUD_PHP="/usr/bin/php"
export NEXTCLOUD_PHP_CONFIG="/etc/php/php.ini"
#export NEXTCLOUD_PHP_CONFIG="/etc/webapps/nextcloud/php.ini"

# composer
export COMPOSER_HOME="$HOME/.composer"
PATH="$PATH:$COMPOSER_HOME/vendor/bin"

# node
if [ -x "$(command -v npm)" ]; then
	export NODE_PATH="$(npm root -g)"
	PATH="$PATH:$NODE_PATH/.bin"
fi

# rubygems
if [ -x "$(command -v ruby)" ]; then
	export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
	PATH="$PATH:$GEM_HOME/bin"
fi

# custom executables
PATH="$PATH:$HOME/.sh/scripts"

# export resulting path
export PATH
