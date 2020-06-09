# Env Variables ---------------------------
GOPATH=/home/$(whoami)/go
export PATH="$PATH:~/bin:$GOPATH/bin"

VISUAL=$(command -v vim)
EDITOR=$VISUAL

# Prompt ----------------------------------
if [[ -f ~/.git-prompt.sh ]]; then
	source ~/.git-prompt.sh
	export PS1='\[\e[0;38;5;114m\]\W\[\e[0;38;5;228m\]$(__git_ps1 " (%s)") \[\e[0m\]\$ '
fi

# Shortcuts -------------------------------
alias e="$EDITOR"
function m() {
	pushd ~/Downloads &> /dev/null
	$(command -v neomutt)
	popd &> /dev/null
}

alias copy="xclip -sel c"
alias rl="source ~/.bashrc"
alias edit="vim ~/.bashrc && source ~/.bashrc"
alias gitb="git log --graph  --pretty=oneline --abbrev-commit"

# Print Backup reminder -------------------
if [ -f ~/.backup/log.txt ]; then
    lastbackup=$(tail -n 1 ~/.backup/log.txt | cut -d - -f 1)
    lastbackuputc=$(date -d "$lastbackup" +%s)
    cutoff=$(date -d "3 days ago" +%s)

    if (( $lastbackuputc < $cutoff )); then
        echo Backup computer! Last backup was on $(date -d "$lastbackup" +"%b %d")
    fi
fi

# Dropbox Daemon --------------------------
if [[ -f ~/.dropbox-dist/dropboxd ]] && ! pgrep dropbox &> /dev/null; then
    nohup ~/.dropbox-dist/dropboxd &> /dev/null &
    disown
fi

# Tmux ------------------------------------
if type tmux &> /dev/null && [[ -z $TMUX ]];
then
    if pgrep tmux &> /dev/null; then
        tmux a && exit
    else
        tmux && exit
    fi
fi

# Fuzzy Searching -------------------------
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# fuzzy edit everywhere
fe() {
	$EDITOR $(fzf)
}
fd() {
	cd $(find * -type d | fzf)
}
