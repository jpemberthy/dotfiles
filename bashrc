# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize

#color
#alias ls='ls -G'
# alias ll='ls -l'
# export CLICOLOR=1
# export LSCOLORS=ExFxCxDxBxegedabagacad

export TERM="xterm-color"

alias ls="ls -G"

PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]"

#let's add de MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

#alias for mysql
alias dbs='sudo /usr/local/mysql/bin/mysqld_safe'
alias dcmertd='scp mertd@209.20.76.22:mertd.sql /Users/jpemberthy/Desktop'

#rails alias
alias ss="ruby script/server webrick --debugger"
alias sc="ruby script/console"
alias tu="ruby test/unit"
alias sg="ruby script/generate"
alias rtest="RAILS_ENV=test"
alias rdevel="RAILS_ENV=development"
alias rprod="RAILS_ENV=production"

alias cpd='cap deploy'
alias rs='rake spec'

#fix autotest
alias autest="RSPEC=true autotest"

#ssh vps personal
alias vps="ssh jpemberthy@64.71.167.222"
alias vpsroot="ssh root@64.71.167.222"
alias vpsmertd="ssh mertd@64.71.167.222"

#acoplet server
alias acoplet="ssh acoplet@190.249.35.94"
alias jpacoplet="ssh jpemberthy@190.249.35.94"

#imagine server

alias imgserver="ssh jpemberthy@200.116.191.204"
alias colmimg="ssh colmimg@190.146.128.192"

#alias app
alias mertd="cd ~/projects/rails_projects/personal/mertd/"

#capistrano alias
alias p_log="cap jprecipes:p_log"


#tex alias
alias mpdf="pdflatex tesis.tex"
alias bmetex="bibtex tesis"

#git alias.
alias commit='git commit -v'
alias pull='git pull'
alias gd='git diff'
alias gfp='git-format-patch'
alias gbb='git bisect bad'
alias gbg='git bisect good'
alias gl='git log'

function gp {
  current_branch=`git branch | grep \* | awk '{print $2}'`
  git push origin $current_branch
}

#apache alias
alias apache2ctl='sudo /opt/local/apache2/bin/apachectl'

export PATH="/usr/local/mysql/bin:$PATH"