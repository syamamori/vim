cp vimrc ~/.vimrc
cp gvimrc ~/.gvimrc
if [ ! -e ~/.vim/rc ]; then
    mkdir ~/.vim/rc
fi
cp -r rc ~/.vim/
cp -r template ~/.vim/

