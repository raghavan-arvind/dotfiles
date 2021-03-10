# Env Variables ---------------------------
GOPATH="${HOME}/go"
export PATH="$PATH:~/bin:$GOPATH/bin"

if which ruby > /dev/null && which gem > /dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

EDITOR_NAME="vim"
VISUAL=$(command -v $EDITOR_NAME)
EDITOR=$VISUAL

# Prompt ----------------------------------
GIT_PROMPT="${HOME}/.scripts/git-prompt.sh"
if [[ -x $GIT_PROMPT ]]; then
	source $GIT_PROMPT
	# export PS1='\[\e[0;38;5;114m\]\W\[\e[0;38;5;228m\]$(__git_ps1 " (%s)") \[\e[0m\]\$ '
    precmd () { __git_ps1 "%F{114}%~%F{228}" " %f$ " " (%s)" }
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

alias copy="xclip -sel c"
alias rl="source ~/.bashrc"
alias edit="vim ~/.bashrc && source ~/.bashrc"
alias gitb="git log --graph  --pretty=oneline --abbrev-commit"
alias jekyll="bundle exec jekyll"

# Print Backup reminder -------------------
BACKUP_BIN="${HOME}/bin/backup_to_drive"
[[ -x $BACKUP_BIN ]] && $BACKUP_BIN --remind

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
[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -z "$ZSH_NAME" ] || [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.scripts/fzf-git.sh ] && source ~/.scripts/fzf-git.sh
fe() { $EDITOR $(fzf) ; }
fa() { $EDITOR $(find ~ | fzf) ; }
fd() { cd $(find * -type d | fzf) ; }
