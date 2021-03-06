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
"Plugin 'editorconfig/editorconfig-vim'
"Plugin 'klen/python-mode'
Plugin 'bash-support.vim'
"Plugin 'bling/vim-airline'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/vimshell.vim'
Plugin 'zeis/vim-kolor'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'VimOutliner'
Plugin 'VOoM'
Plugin 'beyondmarc/glsl.vim'

"Plugin 'Valloric/YouCompleteMe'
Plugin 'cern_root.vim'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'NLKNguyen/easy-navigate.vim'
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
    " ==== leader ====
    let mapleader = ","
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
    nmap <F8> :call FoldColumnToggle()<cr>
    nmap <F10> :set invnumber<cr>
    set pastetoggle=<F2>
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
    " ==== show cursor line ====
    set cursorline
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

    let s:extfname = expand("%:e")
    if s:extfname ==? "py"
        iabbrev #e #!/usr/bin/env python<CR># -*- coding:utf-8 -*-<CR># author: lintao
    elseif s:extfname ==? "tex"
        iabbrev #p \begin{frame}<CR>\frametitle{}<CR>\begin{itemize}<CR>\item<CR>\end{itemize}<CR>\end{frame}
        set spell
    endif

endfunction

" === init readonly ===
function! Init_readonly()
    set foldcolumn=0
    set nonu
endfunction
" === check readonly or edit ===
function! Check_read_only() 
    if &readonly 
        call Init_readonly()
    else
        call Init_edit()
    endif
endfunction

" === init according the buffer ===
function! Init_buffer()
    " ==== edit or readonly ====
    au BufRead,BufNewFile * call Check_read_only()
    " ==== c and makefile ====
    au BufRead,BufNewFile * call Select_c_style()
    au BufRead,BufNewFile Makefile* setlocal noexpandtab
endfunction

" === init ===
call Init_common()
call Init_buffer()

" === color scheme ===
""set background=light
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
"
"colorscheme anderson
"
"set background=dark
"let base16colorspace=256
"colorscheme base16-default
"hi CursorLine term=NONE ctermbg=11
hi CursorLine cterm=NONE ctermbg=255
