cp vimrc ~/.vimrc
if [ ! -e ~/.vim/rc ]; then
    mkdir ~/.vim/rc
fi
cp -r rc ~/.vim/
cp -r template ~/.vim/

