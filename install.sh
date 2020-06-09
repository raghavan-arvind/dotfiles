#!/bin/bash
# Link config files
ln -f .vimrc ~/.vimrc
ln -f .bashrc ~/.bashrc
ln -f .tmux.conf ~/.tmux.conf
ln -f .Xresources ~/.Xresources

# Create required folders
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status
mkdir -p ~/.mutt
mkdir -p ~/.scripts

ln -f .config/i3/config ~/.config/i3/config
ln -f .config/i3status/config ~/.config/i3status/config
ln -f .mutt/colors.standard ~/.mutt/colors.standard
ln -f .mutt/mailcap ~/.mutt/mailcap
ln -f .mutt/muttrc ~/.mutt/muttrc
ln -f scripts/git-prompt.sh ~/.scripts/git-prompt.sh
ln -f scripts/fzf-git.sh ~/.scripts/fzf-git.sh

mkdir -p ~/bin
cp bin/* ~/bin

if type xrdb &> /dev/null; then
	xrdb ~/.Xresources
fi

# Install fzf
if ! type fzf &> /dev/null; then
	rm -rf ~/.fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	printf "y\ny\nn\n" | ~/.fzf/install
	rm -f ~/.fzf.zsh
fi

# Install vim packages
vim_packages=(
	'vimwiki     https://github.com/vimwiki/vimwiki.git'
	'surround    https://tpope.io/vim/surround.git'
	'commentary  https://tpope.io/vim/commentary.git'
	'fzf         https://github.com/junegunn/fzf.vim'
)

OLDIFS=$IFS
IFS=$'\n'
for i in ${vim_packages[@]}; do
	IFS=$OLDIFS
	set -- $i

	name=$1
	git_url=$2
	install_dir=~/.vim/pack/plugins/start/$1
	if [ ! -d $install_dir ]; then
		echo "Installing ${name}..." ;
		git clone $git_url $install_dir;
	fi
done
