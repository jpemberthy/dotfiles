# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

# Make bash check its window size after a process completes
shopt -s checkwinsize

export TERM="xterm-color"
alias ls="ls -G"
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$(parse_git_branch)$\[\033[00m\] "

eval "$(rbenv init -)"

#app alias
alias sk="bundle exec sidekiq -C config/sidekiq.yml"
alias th="cd ~/work/rally/timehub"
alias yura="cd ~/work/lunatic/yurani"
alias yese="cd ~/work/lunatic/yese"
alias jade="cd ~/work/lunatic/jade"
alias fari="cd ~/work/lunatic/Farina"
alias gina="cd ~/work/lunatic/gina"
alias migue="cd ~/work/lunatic/migue"
alias numshot="cd ~/work/lunatic/numshot"
alias aria="cd ~/work/psl/aria4r"
alias whi="cd ~/work/whi/weheartit"
alias meat="cd ~/work/whi/meat"
alias meats="cd ~/work/whi/meat-service"
alias whit="cd ~/work/whi/whi-translator"
alias mari="cd ~/work/lunatic/marianita"
alias devwhi="cd ~/work/whi/developer.weheartit.com"
alias crystal="cd ~/work/whi/crystal"
alias rabbit="cd ~/work/whi/rabbit-hole"
alias remotecass="ssh whi.staging04 -L8888:10.84.189.179:8888"
alias remoterabb="ssh whi.staging04 -L15672:rabbit01:15672  "

#rails alias
alias ss="ruby ./script/server --debugger"
alias sc="ruby ./script/console"
alias sg="ruby ./script/generate"
alias tu="ruby test/unit"
alias rtest="RAILS_ENV=test"
alias rdevel="RAILS_ENV=development"
alias rprod="RAILS_ENV=production"

#rails 3
alias rs="bundle exec rails s"
alias rc="bundle exec rails c"
alias rdb="bundle exec rails db"
alias rg="bundle exec rails generate"
alias bi="bundle install"
alias bch="bundle check"
alias bp="bundle pack"
alias bo="bundle open"

alias cpd='cap deploy'
alias cppd="cap production deploy"

function staging_deploy {
  current_branch=`git branch | grep \* | awk '{print $2}'`

  if [ $# -gt 0 ]; then # we have args
    staging=$1
  else
    staging="staging"
  fi

  gp && bundle exec cap -s branch=$current_branch $staging deploy
}

function running_on {
   sudo lsof -i :$1
}

alias vps="ssh neider@64.71.167.222"
alias timehub="ssh root@65.39.226.140"
#cron alias
alias wup="whenever --update-crontab"
alias crtl="crontab -l"

#git alias.
alias gd='git diff'
alias gfp='git-format-patch'
alias gbb='git bisect bad'
alias gbg='git bisect good'
alias gl='git log'
alias lola='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gcleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias ga='git add'
alias gco='git checkout'
alias gst='git status'
alias gc='git commit -v'

alias redistart='redis-server /usr/local/etc/redis.conf'
alias mongostart='mongod run --config /usr/local/etc/mongod.conf'

alias gitxpop="open -a gitx ."

alias rcam="sudo killall VDCAssistant"

alias ssht='ssh -D 8080 -f -C -q -N neider@bolsaenred.com'

#nanoc alias
alias nacomp="nanoc compile"
alias naview="nanoc view"

# lol alias
alias lolcale="echo 'locale = en_US' > /Applications/League\ of\ Legends.app/Contents/LOL/RADS/system/locale.cfg"

JAVA_HOME="/usr/libexec/java_home"

# https://github.com/pcmanus/ccm/issues/87
function ccmnodesup {
  sudo ifconfig lo0 alias 127.0.0.1 up
  sudo ifconfig lo0 alias 127.0.0.2 up
  sudo ifconfig lo0 alias 127.0.0.3 up
}

function gp {
  current_branch=`git branch | grep \* | awk '{print $2}'`
  git push origin $current_branch
}

function pull {
  current_branch=`git branch | grep \* | awk '{print $2}'`
  git pull origin $current_branch
}

function gpf {
  current_branch=`git branch | grep \* | awk '{print $2}'`
  git push --force origin $current_branch
}

function clog {
  for i in `ls log/*.log`;
  do
    echo "" > $i;
  done
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

alias grep="grep --color=auto"
alias nginx="/usr/local/Cellar/nginx/0.8.54/sbin/nginx"
export EDITOR=/Applications/Atom.app/Contents/MacOS/Atom
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Users/jpemberthy/work/whi/bin:$PATH
export PATH=/usr/local/share/npm/bin/:$PATH

# GO
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
alias got="go test"
alias gog="go get"
alias gob="go build"
alias goi="go install"
alias gohome='cd "$(echo $GOPATH)"'

# export EDITOR=nano
# export EDITOR="/usr/local/bin/mate -w"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Java path
# export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home

# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/Current
eval "$(pyenv init -)"

# alias emacs='open -a /Applications/Emacs.app $1'
