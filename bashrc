export EDITOR=/usr/bin/mate

alias conbg='/Applications/Utilities/Console.app/Contents/MacOS/Console &'

#apps
alias ax='cd ~/work/builders/achievenext/'

#rails alias
alias ss="ruby ./script/server --debugger"
alias sc="ruby ./script/console console"
alias sg="ruby ./script/generate"
alias tu="ruby test/unit"
alias rtest="RAILS_ENV=test"
alias rdevel="RAILS_ENV=development"
alias rprod="RAILS_ENV=production"
alias clog="echo '' > log/development.log && echo '' > log/test.log"

#rails 3
alias rs="rails s --debugger"
alias rc="rails c"
alias rdb="rails db"
alias rg="rails generate"
alias bi="bundle install"
alias bch="bundle check"
alias bp="bundle pack"

alias cpd='cap deploy'
alias cppd="cap production deploy"
alias rs='rake spec'

#ssh vps personal
alias vps="ssh jpemberthy@64.71.167.222"
alias vpsroot="ssh root@64.71.167.222"
alias vpsmertd="ssh mertd@64.71.167.222"

#cron alias
alias wup="whenever --update-crontab"
alias crtl="crontab -l"

#git alias.
alias commit='git commit -v'
alias pull='git pull'
alias gd='git diff'
alias gfp='git-format-patch'
alias gbb='git bisect bad'
alias gbg='git bisect good'
alias gl='git log'
alias lola='git log --graph --decorate --pretty=oneline --abbrev-commit'

function gp {
  current_branch=`git branch | grep \* | awk '{print $2}'`
  git push origin $current_branch
}


[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
##
# Your previous /Users/jpemberthy/.bash_profile file was backed up as /Users/jpemberthy/.bash_profile.macports-saved_2010-09-22_at_11:17:34
##

# MacPorts Installer addition on 2010-09-22_at_11:17:34: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

