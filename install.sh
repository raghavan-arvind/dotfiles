# Link config files
ln -f .vimrc ~/.vimrc
ln -f .bashrc ~/.bashrc
ln -f .tmux.conf ~/.tmux.conf

mkdir -p ~/.config/i3
mkdir -p ~/.config/i3config
mkdir -p ~/.config/polybar

ln -f .config/i3/config ~/.config/i3/config
ln -f .config/i3status/config ~/.config/i3status/config
ln -f .config/polybar/config ~/.config/polybar/config

mkdir -p ~/bin
cp bin/* ~/bin

# Install vim packages
if [ ! -d ~/.vim/pack/plugins/start/vimwiki ]; then
    echo "Installing vimwiki..." ;
    git clone https://github.com/vimwiki/vimwiki.git ~/.vim/pack/plugins/start/vimwiki ; 
fi

if [ ! -d ~/.vim/pack/plugins/start/surround ]; then
    echo "Installing surround..." ;
    git clone https://tpope.io/vim/surround.git ~/.vim/pack/plugins/start/surround ; 
fi

if [ ! -d ~/.vim/pack/plugins/start/commentary ]; then
    echo "Installing commentary..." ;
    git clone https://tpope.io/vim/commentary.git ~/.vim/pack/plugins/start/commentary ; 
fi
