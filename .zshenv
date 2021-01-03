export EDITOR=vim
export BROWSER=firefox
export FILE=nnn
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export TERMINAL=st
