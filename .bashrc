GOPATH=/home/$(whoami)/go
export PATH="$PATH:~/bin:$GOPATH/bin"

if [[ -f ~/.dropbox-dist/dropboxd ]] && ! pgrep dropbox &> /dev/null; then 
    nohup ~/.dropbox-dist/dropboxd &> /dev/null &
    disown
fi

VISUAL=$(command -v vim)
EDITOR=$VISUAL
alias e="$EDITOR"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[\e[0;38;5;114m\]\W\[\e[0m\]\[\e[0;38;5;228m\]$(parse_git_branch)\[\e[0m\] \$ '

alias copy="xclip -sel c"
alias rl="source ~/.bashrc"
alias edit="vim ~/.bashrc && source ~/.bashrc"
open() {
    nohup xdg-open $@ &> /dev/null &
    disown
}

# Reminder to back up local machine
if [ -f ~/.backup/log.txt ]; then
    lastbackup=$(tail -n 1 ~/.backup/log.txt | cut -d - -f 1)
    lastbackuputc=$(date -d "$lastbackup" +%s)
    cutoff=$(date -d "3 days ago" +%s)

    if (( $lastbackuputc < $cutoff )); then
        echo Backup computer! Last backup was on $(date -d "$lastbackup" +"%b %d")
    fi
fi

# Pretty git branch logging
alias gitb="git log --graph  --pretty=oneline --abbrev-commit"

# Attach to or create tmux session
if type tmux &> /dev/null && [[ -z $TMUX ]];
then
    if pgrep tmux &> /dev/null; then 
        tmux a && exit
    else 
        tmux && exit
    fi
fi

[[ -f ~/.bash_temp ]] && source ~/.bash_temp

# Inspired by/adapted from https://github.com/junegunn/fzf/wiki/examples
# fd <optional pattern> - fuzzy cd recursively from cwd
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fdc <optional pattern> - fuzzy cd everywhere
fdc() {
  local dir
  dir=$(find ${1:-/} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fe - fuzzy edit everywhere
fe() {
  local file
  if [[ $# -ne 0 ]]
  then
      file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"
  else
      file="$(locate -Ai -0 / | grep -z -vE '~$' | fzf --read0 -0 -1)"
  fi
  [[ -f $file ]] && $EDITOR $file
}
