alias ls ls -CF --color=auto
alias dir ls -l
alias rm rm -i
alias mv mv -i
alias cp cp -i
alias nano nano -w -z -x
alias pico nano
alias grep grep --color=auto
alias egrep egrep --color=auto
setenv LC_COLLATE C
set prompt=`hostname -s`"% "
uncomplete *
setenv VISUAL nano
setenv EDITOR nano
unset autologout
unhash

