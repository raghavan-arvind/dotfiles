export PATH="$PATH:~/bin"

xset r rate 175 45

if [[ -f ~/.dropbox-dist/dropboxd ]]; then 
    nohup ~/.dropbox-dist/dropboxd &> /dev/null &
    disown
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\e[0;38;5;114m\W\e[m\e[0;38;5;228m\$(parse_git_branch)\e[m $ "

alias copy="xclip -sel c"
alias rl="source ~/.bashrc"
alias edit="vim ~/.bashrc && source ~/.bashrc"

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
alias git="git log --graph  --pretty=oneline --abbrev-commit"

[[ -f ~/.bash_temp ]] && source ~/.bash_temp

