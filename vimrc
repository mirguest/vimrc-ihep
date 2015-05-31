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

" == initialize ===
" === fold column toggle ===
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=2
    endif
endfunction
" === select c style ===
fu Select_c_style()
    if search('^\t', 'n')
        set tabstop=8
        set shiftwidth=8
    el 
        set tabstop=4
        set shiftwidth=4
    en
endf
" === init common ===
function! Init_common() 
    " ==== chdir ====
    set autochdir
    " ==== color ====
    set t_Co=256
    " ==== encoding ====
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8,gbk,cp936
    set termencoding=utf-8
    " ==== menu ====
    set wildmenu
    " ==== helper window ====
    map <c-w><c-f> :FirstExplorerWindow<cr>
    map <c-w><c-b> :BottomExplorerWindow<cr>
    map <c-w><c-t> :WMToggle<cr> 
    let g:winManagerWindowLayout='FileExplorer|TagList|BufExplorer'
    let g:winManagerWidth=35
    nmap <F3> :WMToggle<cr>
    " ==== the toggle of fold column and line number ====
    nmap <F9> :call FoldColumnToggle()<cr>
    nmap <F10> :set invnumber<cr>
    " ==== fold related ====
    "set colorcolumn=80
    set foldmethod=syntax
    set foldlevelstart=99
    
    let fortran_free_source=1
    unlet! fortran_fixed_source
    
    let fortran_more_precise=1
    let fortran_do_enddo=1
    let fortran_fold=1
    let fortran_fold_conditionals=1
    
    " For Javascript
    let javaScript_fold=1         " JavaScript
    " ==== disable the mouse ====
    set mouse=""
    set mousehide
    " ==== syntax relatex ====
    filetype plugin on
    filetype plugin indent on
    syntax enable
    syntax on
    " ==== indent color ====
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=4
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
    
    let g:indent_guides_guide_size=1
    
    " ==== different file type ====
    au BufRead,BufNewFile *.icc                set filetype=cpp
    au BufRead,BufNewFile *.icpp                set filetype=cpp
    au BufRead,BufNewFile wscript                set filetype=python
    au BufNewFile,BufRead *.cuh                  setf cuda 
    " ==== status ===
    set laststatus=2
    " ==== show the tabs ====
    set list
    set listchars=tab:\|\ 
    " function end
    " ==== status line ====
    set laststatus=2
endfunction

" === init edit ===
function! Init_edit()
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
    set foldcolumn=2

endfunction

" === init readonly ===
function! Init_readonly()
    set foldcolumn=0
    set nonu
endfunction

" === init ===
call Init_common()
au BufRead,BufNewFile * call Check_read_only()
function! Check_read_only() 
    if &readonly 
        call Init_readonly()
    else
        call Init_edit()
    endif
endfunction
" === color scheme ===
let g:solarized_termcolors=256
"set background=light
set background=dark
colorscheme solarized
