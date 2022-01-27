# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

# Make bash check its window size after a process completes
shopt -s checkwinsize

# export TERM="xterm-color"
alias ls="ls -G"
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$(parse_git_branch)$\[\033[00m\] "

#rails alias
alias ss="bin/server"
alias sc="bin/console"
alias tt="bin/rails test"
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
alias brspec="bundle exec rspec"

# bundle
alias be="bundle exec"
alias beer="bundle exec ruby"

function running_on {
    sudo lsof -i :$1
}

#cron alias
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
alias gitcount='git log --format=format:%an | sort | uniq -c | sort -r'

alias redistart='redis-server /usr/local/etc/redis.conf'

function gp {
  current_branch=`git branch | grep \* | awk '{print $2}'`
  git push origin $current_branch
}

function pull {
  current_branch=`git branch | grep \* | awk '{print $2}'`
  git pull origin $current_branch
}

function gcofile {
  git checkout $1 -- $2
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function running_on {
    netstat -vanp tcp | grep $1
}

function kill_running_on {
    running_on $1 | awk '{print $9}' | xargs kill -9
}

alias t="bin/tt"
alias s="cd /workspaces/github && script/server"

function git_delete_all_merged {
  git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d
}

function forever {
    while true
    do
        "$@"
    done
}

alias grep="grep --color=auto"
