cp vimrc ~/.vimrc
cp gvimrc ~/.gvimrc
cp cc.vim ~/.vim/userrc/cc.vim
if [ ! -e ~/.vim/rc ]; then
    mkdir ~/.vim/rc
fi
cp -r rc ~/.vim/
cp -r template ~/.vim/

