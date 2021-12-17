#  zsh setup
# ----------- ---- -- -

# enable autocompletion
autoload -Uz compinit && compinit

# functions & aliases
source ~/.shell/fn.sh

# powerlevel10k
source ~/.p10k/powerlevel10k.zsh-theme && source ~/.p10k.zsh

# cd hook (ls after cd)
chpwd() {
  emulate -L zsh
  ls
}

# show system infos
echo
free; echo
df -hT; echo
systemctl --failed; echo
