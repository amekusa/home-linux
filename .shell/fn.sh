#  shell functions & aliases
# --------------------------- ---- -- -


# ---- Aliases ----

# ls with options
alias ls='ls --color --group-directories-first'
alias ll='ls -hl'
alias la='ls -hal'

# run the previous command with sudo
alias plz='sudo $(fc -ln -1)'

# sudo shortcuts
alias pacman='sudo pacman'
alias sys='sudo systemctl'
alias snano='sudo nano'

# lazygit
alias lg='lazygit'


# ---- Functions ----

# fancy find
f() {
  if [ -z "$1" ]; then
    echo "Usage:"
    echo "  f query [basedir] [maxdepth]"
    return 1
  fi
  local dir='.'; [ -z "$2" ] || dir="$2"
  local depth=2; [ -z "$3" ] || depth="$3"
  find "$dir" -maxdepth "$depth" -iname "*${1}*"
}

# find and cd
fcd() {
  if [ -z "$1" ]; then
    echo "Usage:"
    echo "  fcd query [basedir] [maxdepth]"
    return 1
  fi
  local dir='.'; [ -z "$2" ] || dir="$2"
  local depth=2; [ -z "$3" ] || depth="$3"
  local dest=$(find "$dir" -maxdepth "$depth" -type d -iname "*${1}*" -print -quit)
  if [ -z $dest ]; then
    echo "'${1}' is not found"
    return 1
  fi
  cd "$dest"
}
