git pull
LDFLAGS="-Wl,-rpath=${HOME}/.pyenv/versions/2.7.13/lib:${HOME}/.pyenv/versions/3.6.2/lib"
./configure \
	--prefix=$HOME/Download/bin \
    --enable-fail-if-missing \
    --enable-luainterp \
    --enable-perlinterp \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-tclinterp \
    --enable-rubyinterp=yes \
    --enable-multibyte \
    --enable-fontset \
    --enable-gui=gtk2 \
    --with-features=huge \
    --with-luajit \
	--enable-cscope \
make
sudo make install
