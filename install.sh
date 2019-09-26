# Link config files
ln -f .vimrc ~/.vimrc
ln -f .bashrc ~/.bashrc
ln -f .tmux.conf ~/.tmux.conf


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
