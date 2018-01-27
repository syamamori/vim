if [ ! -e ~/.vim/rc ]; then
    mkdir ~/.vim/rc
fi
if [ ! -d ~/.vim/userrc ]; then
    mkdir ~/.vim/userrc
fi

cp vimrc ~/.vimrc
cp gvimrc ~/.gvimrc
cp cc.vim ~/.vim/userrc/cc.vim

cp -r rc ~/.vim/
cp -r template ~/.vim/
