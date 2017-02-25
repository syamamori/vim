git pull
./configure --with-features=huge \
            --prefix=/home/work/yamamori/utils/ \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --with-lua-prefix=/home/work/yamamori/utils/ \
            --enable-luajit \
            --enable-gui=gtk2 \
            --enable-cscope 
make VIMRUNTIMEDIR=~/.vim/vim74
make install
