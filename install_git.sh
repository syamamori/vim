git clone https://github.com/vim/vim.git ~/vim
cd ~/vim
# LDFLAGS="-Wl,-rpath=${HOME}/.pyenv/versions/2.7.13/lib:${HOME}/.pyenv/versions/3.6.2/lib"
sudo ./configure \
    --prefix=$HOME/bin \
    --enable-fail-if-missing \
    --with-features=huge \
    --enable-clipboard \
    --enable-fontset \
    --enable-multibyte \
    --enable-gui=gtk2 \
    --enable-luainterp \
    --enable-perlinterp \
    --enable-rubyinterp \
    --enable-tclinterp \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --with-luajit \
    --enable-cscope \

sudo make
sudo make reconfig
sudo make install
