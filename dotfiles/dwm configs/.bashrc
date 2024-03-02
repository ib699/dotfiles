#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -al --color=auto'                                         
alias cls='clear'

if [[ "$(cat /proc/$PPID/comm)" = "st" ]]; then
    transset-df "0.85" --id "$WINDOWID" >/dev/null
fi

PS1='[\u@\h \W]\$ '
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi



