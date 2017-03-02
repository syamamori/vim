cp vimrc ~/.vimrc
cp -r rc ~/.vim/
if [ ! -e  ~/.vim/utils/dein/repos/github.com/Shougo/ ]; then
    cd ~/.vim/utils/dein/repos/github.com/Shougo/
    git clone https://github.com/Shougo/dein.vim.git .
fi
