#
# ~/.bashrc
#

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh
source ~/.bash_aliases
source <(kubectl completion bash | sed s/kubectl/k/g)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

export PATH=~/.local/bin:$PATH
export KUBECONFIG=~/.kube/config-kubernetes-production-eu-west-1
export KUBE_EDITOR=vim

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/shadow/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/shadow/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/shadow/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/shadow/Downloads/google-cloud-sdk/completion.bash.inc'; fi
