# Env Variables ---------------------------
GOPATH=/home/$(whoami)/go
export PATH="$PATH:~/bin:$GOPATH/bin"

if which ruby > /dev/null && which gem > /dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

EDITOR_NAME="vim"
VISUAL=$(command -v $EDITOR_NAME)
EDITOR=$VISUAL

# Prompt ----------------------------------
if [[ -f ~/.scripts/git-prompt.sh ]]; then
	source ~/.scripts/git-prompt.sh
	export PS1='\[\e[0;38;5;114m\]\W\[\e[0;38;5;228m\]$(__git_ps1 " (%s)") \[\e[0m\]\$ '
fi

# Shortcuts -------------------------------
function e() {
	names=("$EDITOR_NAME" "EDITOR")
	found="false"
	for n in ${names[@]}; do
		if jobs | rg -q "$n"; then
			found="true"
			jobnum=$(jobs | rg -q "$n" | tr -d -c 0-9)
			fg $jobnum
			return
		fi
	done
	[ $found = "false" ] && $EDITOR
}
function m() {
	pushd ~/Downloads &> /dev/null
	$(command -v neomutt)
	popd &> /dev/null
}

alias copy="xclip -sel c"
alias rl="source ~/.bashrc"
alias edit="vim ~/.bashrc && source ~/.bashrc"
alias gitb="git log --graph  --pretty=oneline --abbrev-commit"
alias jekyll="bundle exec jekyll"

# Print Backup reminder -------------------
BACKUP_BIN="/home/$(whoami)/bin/backup_to_drive"
[[ -f $BACKUP_BIN ]] && $BACKUP_BIN --remind

# Dropbox Daemon --------------------------
DROPBOX_BIN="~/.dropbox-dist/dropboxd"
if [[ -f $DROPBOX_BIN ]] && ! pgrep dropbox &> /dev/null; then
    nohup $DROPBOX_BIN &> /dev/null &
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
[ -f ~/.scripts/fzf-git.sh ] && source ~/.scripts/fzf-git.sh
fe() { $EDITOR $(fzf) ; }
fd() { cd $(find * -type d | fzf) ; }
