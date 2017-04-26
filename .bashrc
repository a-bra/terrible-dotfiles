#
# ~/.bashrc
#

source ~/.git-completion.sh
source ~/.git-prompt.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

temp=$(tty)
GRAD1=${temp:5}
arrow=$'\uE0B0'

#PS1='[\u@\h \W]\$ '
PS1='\t [\[\033[32m\]\u\[\033[0m\]@\[\033[36m\]\h\[\033[0m\]($GRAD1) \W]\[\033[35m\]$(__git_ps1 " (%s)") \[\033[30;44m\]$arrow\[\033[44m\]    \[\033[0;34m\]$arrow\[\033[0m\] '
setxkbmap -option "caps:swapescape"
