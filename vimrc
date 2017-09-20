"release autogroup in MyAutoCmd"
augroup MyAutoCmd
    autocmd!
augroup END 

if &compatible
    set nocompatible
endif
syntax on
set viminfo='10,\"100,:20,%,n~/.viminfo
set expandtab
set tabstop=4
set shiftwidth =4
"set autoindent
"set smartindent
set smarttab
set relativenumber
set backspace=indent,eol,start
set t_ti=""
set t_te=""
set ruler
set background=dark
set wildmode=longest,list
"set clipboard=exclude:.*
set nosplitbelow
set mouse=""
set foldmethod=indent
set nofoldenable
" Status Bar
set laststatus=2
set statusline=%f "tail of the filename

set encoding=utf-8
set fileencoding=japan
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

set formatoptions=qm

set spelllang+=cjk " spell check から日本語除外
set ignorecase "大文字小文字の区別なし
set smartcase   "検索文字に大文字があるときは区別する
set incsearch   "インクリメントサーチ
set hlsearch    "検索マッチテストをハイライト

set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set completeopt=menuone " 標準の補完のプレビューを消す．
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

 " バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    " set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
    set clipboard& clipboard+=unnamedplus,unnamed
else
    " set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00 autoselect 削除
    set clipboard& clipboard+=unnamed
endif

" Swapファイル？Backupファイル？前時代的すぎなので全て無効化する
set nowritebackup
set nobackup
set noswapfile

set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
" set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " その代わり80文字目にラインを入れる


"set paste   " ペースト時のインデントを無効に
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

if version < 600
    syntax clear
elseif exists('b:current_after_syntax')
    finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self

hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special

let b:current_after_syntax = 'python'
let &cpo = s:cpo_save
unlet s:cpo_save

" Custom Key Mapping
" map \h :vertical resize -10<CR>
" map \j :res +5<CR>
" map \k :res -5<CR>
" map \l :vertical resize +10<CR>
"Make
autocmd FileType make setlocal noexpandtab
noremap \cm :make<SPACE>clean<CR>:make!<CR>
noremap \m :make!<CR>

autocmd FileType tex setlocal spell
" Fold
nnoremap <space> za

map <C-l> :let @/ = ""<CR>

"\や？を状況に合わせて自動エスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" Move cursor back to position
function! Rescur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup rescur
  autocmd!
  autocmd bufwinenter * call Rescur()
augroup end

" Clear Search Register
autocmd VimEnter * :let @/=""

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" 入力モード中に素早くCjと入力した場合はESCとみなす
inoremap <silent> <C-j> <Esc>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っj <ESC>

" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n','g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

 " make, grep などのコマンド後に自動的にQuickFixを開く
autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

 " QuickFixおよびHelpでは q でバッファを閉じる
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

 " w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
autocmd MyAutoCmd VimEnter * call s:ChangeCurrentDir('', '')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
    if a:bang == ''
        pwd
    endif
endfunction

" ~/.vimrc.localが存在する場合のみ設定を読み 込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

" set syntax highlight jinja -> vams
au BufNewFile,BufRead *.jinja set filetype=verilogams
" set markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
let g:tex_flavor='latex'
 

"plugin より先の設定

" | 指定された path が $PATH に存在せず、ディレクトリとして存在している場合
" | のみ $PATH に加える
function! IncludePath(path)
    " define delimiter depends on platform
    if has('win16') || has('win32') || has('win64')
        let delimiter = ";"
    else
        let delimiter = ":"
    endif
    let pathlist = split($PATH, delimiter)
    if isdirectory(a:path) && index(pathlist, a:path) == -1
        let $PATH=a:path.delimiter.$PATH
    endif
endfunction
" ~/.pyenv/shims を $PATH に追加する
" これを行わないとpythonが正しく検索されない
let s:pyenvdir = expand('~/.pyenv/shims')
if isdirectory(s:pyenvdir)
    if has('gui_macvim')
        set pythondll=$HOME/.pyenv/versions/anaconda-4.0.0/lib/libpython2.7.dylib
        set pythondll=$HOME/.pyenv/versions/2.7.13/lib/libpython2.7.dylib
        set pythonthreedll=$HOME/.pyenv/versions/3.6.2/lib/libpython3.6m.dylib
    endif
    call IncludePath(expand('~/.pyenv/shims'))
endif

"dein.vim のインストール
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/utils/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
" if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
" endif

" 設定開始
if dein#load_state(s:dein_dir)
    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
    call dein#begin(s:dein_dir, [$MYVIMRC, s:toml, s:lazy_toml])
    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
   " 設定終了
    call dein#end()
    call dein#save_state()
endif

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc.vim'])
    call dein#install(['vimproc.vim'])
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif
set runtimepath+=~/.vim/
runtime! userrc/*.vim
filetype plugin indent on

 " ステータスラインの表示
set statusline=%<     " 行が長すぎるときに切り詰める位置
set statusline+=[%n]  " バッファ番号
set statusline+=%m    " %m 修正フラグ
set statusline+=%r    " %r 読み込み専用フラグ
set statusline+=%h    " %h ヘルプバッファフラグ
set statusline+=%w    " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y    " バッファ内のファイルのタイプ
set statusline+=\     " 空白スペース
if winwidth(0) >= 130
  set statusline+=%F    " バッファ内のファイルのフルパス
else
  set statusline+=%t    " ファイル名のみ
endif
set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
set statusline+=\ \   " 空白スペース2個
set statusline+=%1l   " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数
set statusline+=,
set statusline+=%c    " 何列目にカーソルがあるか
set statusline+=%V    " 画面上の何列目にカーソルがあるか
set statusline+=\ \   " 空白スペース2個
set statusline+=%P    " ファイル内の何％の位置にあるか
