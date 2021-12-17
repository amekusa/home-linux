#  zsh setup
# ----------- ---- -- -

# enable autocompletion
autoload -Uz compinit && compinit

source ~/.shell/fn.sh

# cd hook (ls after cd)
chpwd() {
  emulate -L zsh
  ls
}
