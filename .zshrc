#  zsh setup
# --------------- *

# uncomment to analyze the zsh startup time
# zmodload zsh/zprof
# NOTE: this enables `zprof` command which shows the stat

# options
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

# fn + delete = forward delete
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char

# functions & aliases
. ~/.sh/fn.sh

# cd hook (ls after cd)
chpwd() {
	emulate -L zsh
	ls
}

# z
. ~/.sh/repos/zsh-z/zsh-z.plugin.zsh

# autosuggestions
. ~/.sh/repos/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# powerlevel10k
. ~/.sh/repos/powerlevel10k/powerlevel10k.zsh-theme
. ~/.p10k.zsh
# NOTE: to customize, run `p10k configure`

# syntax highlighting
. ~/.sh/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# NOTE: this line should be at the end of .zshrc

# initialize the completion system
autoload -Uz compinit && compinit

# show system infos
echo
free; echo
df -hT; echo
systemctl --failed; echo
