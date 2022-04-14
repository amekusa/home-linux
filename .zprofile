#  zsh login setup
# ----------------- ---- -- -

# environment variables
source ~/.sh/env

# command history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=512
export SAVEHIST=$HISTSIZE

# zsh-completions
export FPATH="$HOME/.sh/zsh-completions/src:$FPATH"
