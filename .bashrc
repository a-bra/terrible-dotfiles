#
# ~/.bashrc
#

source ~/.git-completion.sh
source ~/.git-prompt.sh
temp=$(tty)
GRAD1=${temp:5}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\t [\[\033[32m\]\u\[\033[0m\]@\[\033[36m\]\h\[\033[0m\]($GRAD1) \W]\[\033[35m\]$(__git_ps1 " (%s)")\[\033[0m\]\$ '

setxkbmap -option "caps:swapescape"
