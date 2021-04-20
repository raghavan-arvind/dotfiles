#!/bin/bash
# Create required folders
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status
mkdir -p ~/.scripts
mkdir -p ~/.task/hooks

# Link config files
config_files=(
    '.vimrc'
    '.zshrc'
    '.tmux.conf'
    '.Xresources'
    '.gitconfig'
    '.config/i3/config'
    '.config/i3status/config'
    '.scripts/git-prompt.sh'
    '.scripts/fzf-git.sh'
)

# Create softlinks to config files
pushd $HOME &> /dev/null
for f in ${config_files[@]}; do
    ln -s -f "${HOME}/dotfiles/${f}" $f
done
popd &> /dev/null

# Copy bin directory
mkdir -p ~/bin
cp bin/* ~/bin

if type xrdb &> /dev/null; then
	xrdb ~/.Xresources
fi

# Install fzf
if ! type fzf &> /dev/null || [ ! -d ~/.fzf ]; then
	rm -rf ~/.fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	printf "y\ny\nn\n" | ~/.fzf/install
	rm -f ~/.fzf.bash
fi

# Install vim packages
vim_packages=(
	'vimwiki     https://github.com/vimwiki/vimwiki.git'
	'surround    https://tpope.io/vim/surround.git'
	'commentary  https://tpope.io/vim/commentary.git'
	'fzf         https://github.com/junegunn/fzf.vim'
	'fugitive    https://tpope.io/vim/fugitive.git'
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

source ~/.zshrc
