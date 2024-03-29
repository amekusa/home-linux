#  shell functions & aliases
# --------------------------- *


# ---- aliases ----

# cd
alias ..='cd ..'
alias ...='cd ../../'

# ls with options
alias ls='ls -p --color --group-directories-first'
alias ll='ls -hl'
alias la='ls -hal'

# run the previous command with sudo
alias plz='sudo $(fc -ln -1)'

# sudo shortcuts
alias pacman='sudo pacman'
alias sys='sudo systemctl'
alias f2b='sudo fail2ban-client'
alias snano='sudo nano'
alias sless='sudo less'
alias wless='sudo less +F -S'

# pacman
alias pacupd='pacman -Sy --needed archlinux-keyring; pacman -Syu; sudo pacdiff'

# lazygit
alias lg='lazygit'

# fix micro + tmux conflicts
alias micro='TERM=xterm-256color micro'

# npm shortcuts
alias nrun='npm run'
alias nbuild='npm run build'
alias ntest='npm run test'
alias nwatch='npm run watch'


# ---- functions ----

# reload .bashrc or .zshrc
reload() {
	local sh=bash
	[ -z $ZSH_VERSION ] || sh=zsh
	echo "Reloading .${sh}rc ..."
	source ~/.${sh}rc && echo "Done."
	echo
}

# find
f() {
	if [ -z "$1" ]; then
		echo "Usage:"
		echo "  f <query> [basedir] [maxdepth]"
		return 1
	fi
	local dir='.'; [ -z "$2" ] || dir="$2"
	local depth=2; [ -z "$3" ] || depth="$3"
	find "$dir" -maxdepth "$depth" -iname "*${1}*"
}

# find & cd
fcd() {
	if [ -z "$1" ]; then
		echo "Usage:"
		echo "  fcd <query> [basedir] [maxdepth]"
		return 1
	fi
	local dir='.'; [ -z "$2" ] || dir="$2"
	local depth=2; [ -z "$3" ] || depth="$3"
	local dest=$(find "$dir" -maxdepth "$depth" -type d -iname "*${1}*" -print -quit)
	if [ -z "$dest" ]; then
		echo "'${1}' is not found"
		return 1
	fi
	cd "$dest"
}

# mkdir & cd
mkcd() {
	if [ -z "$1" ]; then
		echo "Usage:"
		echo "  mkcd <dir>"
		return 1
	fi
	if [ -d "$1" ]; then
		echo "dir '$1' already exists"
		cd -- "$1"
		return
	fi
	mkdir -p -- "$1" &&
	cd -- "$1"
}

# site health checker
http() {
	if [ -z "$1" ]; then
		echo "Usage:"
		echo "  http <location>"
		echo "  http <location> -s (for HTTPS)"
		return 1
	fi
	local protocol=http
	[ "$2" = "-s" ] && protocol=https
	local ua="Site Health Check"
	local r="$(curl -Is -A "$ua" -o /dev/null -w '%{http_code} (%{time_total}s)\n' "$protocol://$1")"
	echo "$r"
	local s="${r:0:3}"
	[ "$s" -ge 200 ] && [ "$s" -lt 400 ]
}

# site health checker (HTTPS)
https() {
	if [ -z "$1" ]; then
		echo "Usage:"
		echo "  https <location>"
		return 1
	fi
	http "$1" -s
}
