# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

# Make bash check its window size after a process completes
shopt -s checkwinsize

export TERM="xterm-color"
alias ls="ls --color"
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$(parse_git_branch)$\[\033[00m\] "

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

function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

alias grep="grep --color=auto"

export EDITOR=emacs
