# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

# Make bash check its window size after a process completes
shopt -s checkwinsize

export TERM="xterm-color"
alias ls="ls -G"
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$(parse_git_branch)$\[\033[00m\]"

#app alias
alias ax="cd ~/work/builders/achievenext"
alias ax2="cd ~/work/builders/AchieveX"
alias vytl="cd ~/work/builders/vytl"
alias ib="cd ~/work/internships"
alias sk="bundle exec sidekiq -C config/sidekiq.yml"
alias th="cd ~/work/rally/timehub"
alias yura="cd ~/work/lunatic/yurani"
alias yese="cd ~/work/lunatic/yese"
alias jade="cd ~/work/lunatic/jade"
alias migue="cd ~/work/lunatic/migue"
alias numshot="cd ~/work/lunatic/numshot"
alias aria="cd ~/work/psl/aria4r"
alias whi="cd ~/work/whi/weheartit"
alias whit="cd ~/work/whi/whi-translator"
alias mari="cd ~/work/lunatic/marianita"

#rails alias
alias ss="ruby ./script/server --debugger"
alias sc="ruby ./script/console"
alias sg="ruby ./script/generate"
alias tu="ruby test/unit"
alias rtest="RAILS_ENV=test"
alias rdevel="RAILS_ENV=development"
alias rprod="RAILS_ENV=production"

#rails 3
alias rs="rails s --debugger"
alias rc="rails c"
alias rdb="rails db"
alias rg="rails generate"
alias bi="bundle install"
alias bch="bundle check"
alias bp="bundle pack"
alias bo="bundle open"
alias rake_scratch="rake db:drop && rake db:create && rake db:migrate && rake db:test:prepare && rake"

alias cpd='cap deploy'
alias cppd="cap production deploy"
alias rs='rake spec'

alias vps="ssh neider@64.71.167.222"
alias timehub="ssh root@65.39.226.140"
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

alias redistart='redis-server /usr/local/etc/redis.conf'
alias mongostart='mongod run --config /usr/local/etc/mongod.conf'

alias ssht='ssh -D 8080 -f -C -q -N neider@bolsaenred.com'

JAVA_HOME="/usr/libexec/java_home"

function gp {
  current_branch=`git branch | grep \* | awk '{print $2}'`
  git push origin $current_branch
}

function clog {
  for i in `ls log/*.log`;
  do
    echo "" > $i;
  done
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

alias grep="grep --color=auto"
alias nginx="/usr/local/Cellar/nginx/0.8.54/sbin/nginx"
export EDITOR=/Applications/TextMate.app//Contents/SharedSupport/Support/bin/mate
# export EDITOR=nano
# export EDITOR="/usr/local/bin/mate -w"

[[ -s "/Users/jpemberthy/.rvm/scripts/rvm" ]] && source "/Users/jpemberthy/.rvm/scripts/rvm"  # This loads RVM into a shell session.

