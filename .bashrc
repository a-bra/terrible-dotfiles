#
# ~/.bashrc
#

source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

temp=$(tty)
GRAD1=${temp:5}
RED='\033[32m'
GRN='\033[33m'
YLW='\033[31m'
DEF='\033[0m'

alias ls='ls --color=auto'
alias ll='ls --color=auto -la'

setxkbmap -option caps:swapescape

#PS1='[\u@\h \W]\$ '
PS1='\t [\[\033[32m\]\u\[\033[0m\]@\[\033[36m\]\h\[\033[0m\]($GRAD1) \W]\[\033[35m\]$(__git_ps1 " (%s)") `if [ $? = 0 ]; then echo \[\033[32m\]𝛌\[\033[0m\]; else echo \[\033[31m\]𝛌\[\033[0m\]; fi` \[\033[0m\]'

eval $(keychain --eval --quiet)
