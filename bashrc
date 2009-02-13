# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize

#color
alias ls='ls -G'

#let's add de MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

#alias for mysql
alias dbs='sudo /usr/local/mysql/bin/mysqld_safe'

#rails alias
alias ss="ruby script/server webrick --debugger"
alias sc="ruby script/console"
alias tu="ruby test/unit"
alias sg="ruby script/generate"
alias rtest="RAILS_ENV=test"
alias rdevel="RAILS_ENV=development"
alias rprod="RAILS_ENV=production"

#fix autotest
alias autest="RSPEC=true autotest"

#ssh vps personal
alias vps="ssh jpemberthy@209.20.76.22"
alias vpsroot="ssh root@209.20.76.22"
alias vpsdeploytest="ssh deploytest@209.20.76.22"
alias vpsmertd="ssh mertd@209.20.76.22"

#acoplet server
alias acoplet="ssh acoplet@201.232.143.199"
alias jpacoplet="ssh jpemberthy@201.232.143.199"

#alias app
alias mertd="cd ~/projects/rails_projects/personal/mertd/"

export PATH="/usr/local/mysql/bin:$PATH"