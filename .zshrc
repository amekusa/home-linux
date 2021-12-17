#  zsh setup
# ----------- ---- -- -

# enable autocompletion
autoload -Uz compinit && compinit

# functions & aliases
source ~/.shell/fn.sh

# zsh-z
# $ git clone https://github.com/agkozak/zsh-z.git ~/.shell/
source ~/.shell/zsh-z/zsh-z.plugin.zsh

# powerlevel10k
# $ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.shell/
source ~/.shell/powerlevel10k/powerlevel10k.zsh-theme && source ~/.p10k.zsh

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
