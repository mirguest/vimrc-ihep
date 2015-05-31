set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" My bundles
"
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlp.vim'
Plugin 'vimwiki'
Plugin 'taglist.vim'
Plugin 'c.vim'
Plugin 'winmanager'
Plugin 'bufexplorer.zip'
" From http://unlogic.co.uk/posts/vim-python-ide.html
" This need fonts and fontconfig. See Doc.
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'atdt/vim-mediawiki'
"Plugin 'klen/python-mode'
Plugin 'bash-support.vim'
"Plugin 'bling/vim-airline'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/vimshell.vim'
Plugin 'zeis/vim-kolor'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'VimOutliner'
Plugin 'VOoM'
" End My bundles
"
"
call vundle#end()

source $VIMRUNTIME/vimrc_example.vim

filetype plugin indent on

set t_Co=256

set pastetoggle=<F2>

"set tw=79
"set wrap
"set linebreak

set autochdir

nmap <F9> :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=2
    endif
endfunction


set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,cp936
set termencoding=utf-8
set wildmenu
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr> 
let g:winManagerWindowLayout='FileExplorer|TagList|BufExplorer'
let g:winManagerWidth=35
nmap <F3> :WMToggle<cr>
nmap <F10> :set invnumber<cr>

"set langmenu=zh_CN.UTF-8

"language messages zh_CN.utf-8
"language messages en_US.utf8
"set helplang=cn
autocmd FileType python set omnifunc=pythoncomplete#Complete

"set guifont=Courier\ New\ 12
set guifont=DejaVu\ Sans\ Mono\ 10
set mouse=""
set mousehide


let s:extfname = expand("%:e")
if s:extfname ==? "py"
    iabbrev #e #!/usr/bin/env python<CR># -*- coding:utf-8 -*-<CR># author: lintao

endif

if s:extfname ==? "tex"
    iabbrev #p \begin{frame}<CR>\frametitle{}<CR>\begin{itemize}<CR>\item<CR>\end{itemize}<CR>\end{frame}
    set spell
endif

map <C-F12> <Plug>VimwikiToggleListItem

filetype plugin on
filetype plugin indent on
syntax enable
syntax on


" map something
map <leader>t2 <ESC>:set ts=2<CR>
map <leader>t4 <ESC>:set ts=4<CR>
map <leader>t8 <ESC>:set ts=8<CR>
map <leader>tr <ESC>:%retab<CR>

" copy from python-src/Misc/Vim/vimrc
fu Select_c_style()
    if search('^\t', 'n')
        set tabstop=8
        set shiftwidth=8
    el 
        set tabstop=4
        set shiftwidth=4
    en
endf
au BufRead,BufNewFile * call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab

let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

au BufRead,BufNewFile *.icc                set filetype=cpp
au BufRead,BufNewFile *.icpp                set filetype=cpp
au BufRead,BufNewFile wscript                set filetype=python
au BufNewFile,BufRead *.cuh                  setf cuda 

let g:indent_guides_guide_size=1

set laststatus=2

"let g:airline_theme="murmur"
"
set guioptions-=m
set guioptions-=T

" check whether readonly or not
au BufRead,BufNewFile * call Check_read_only()
fu Check_read_only() 
echo &readonly
if &readonly 
    echo "readonly"
else
    echo "not readonly"
    set nu
    set expandtab
    set tabstop=4
    set softtabstop=4
    "set backspace=2
    set nobackup
    set shiftwidth=4
    " For DIRAC
    "set tabstop=2
    "set softtabstop=2
    "set shiftwidth=2
    set autoindent
    set smartindent
    set smarttab
    set ambiwidth=double
    set list
    set listchars=tab:\|\ 
    set foldmethod=syntax
    set foldcolumn=2
    set foldlevelstart=99

    set colorcolumn=80

    let fortran_free_source=1
    unlet! fortran_fixed_source

    let fortran_more_precise=1
    let fortran_do_enddo=1
    let fortran_fold=1
    let fortran_fold_conditionals=1

    " For Javascript
    let javaScript_fold=1         " JavaScript
endif
endf



let g:solarized_termcolors=256
"set background=light
set background=dark
colorscheme solarized
"
"set background=light
"colorscheme torte
"
