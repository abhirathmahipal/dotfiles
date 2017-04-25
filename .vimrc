" Vi mode isn't required
set nocompatible

" Vundle plugin manager (works with Windows and Linux)
" Chose this over Pathogen as it was a pain to reinstall stuff on git
" subsystem on windows

" vundle needs filtype plugins off
" turn it on again later
filetype plugin indent off
syntax off

" set the runtime path for vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Insert mode autocomplete
Plugin 'ervandew/supertab'

" Emmet only for PHP and HTML
Plugin 'mattn/emmet-vim' " TODO load only HTML and PHP

" Tree explorer. Load only when needed
Plugin 'scrooloose/nerdtree' "TODO load only when required


call vundle#end()
" end of vundle related stuff

" turning it on again
" load filetype-specific indent files & file specific plugins
filetype plugin indent on 
syntax enable

" Allow mouse
set mouse=a


" Allow 256 colours
set t_Co=256

" Title
" TODO Change edited file status to * from +
set title

" Theme

" Allow backspace everywhere and fix backspace issue
set backspace=indent,eol,start

" Reload when file changes externally (useful after git stash)
set autoread

" No backups please
set noswapfile
set nobackup
set nowb

" Replace tabs with spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4 " when backspace is pressed, remove four spaces if there was a tab


" Shift + Tab reverse tab TODO


" When a line is created, autoindent stuff
set autoindent

" Show matching bracket
set showmatch

" search options
" Read more about smart search if needed
set hlsearch                                " Highlight all occurrences
set incsearch                               " Search as you type, incremental search
set ignorecase                              " ignore case while searching


" line number and highlight current line
set number
set cursorline
highlight CursorLine cterm=bold ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set ruler


" Autocomplete for Vim commands
set wildmenu

" highlight column 81 to encourage shorter lines
set colorcolumn=81

" Keep search results to the middle of the screen (Shrayas)
nnoremap n nzzzv
nnoremap N Nzzzv

" This is a really huge chunk to swap lines taken from Gokul's .vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common typos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:command WQ wq
:command Wq wq
:command W w
:command Q q


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to swap two lines at n1 and n2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to swap line and line above
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to swap line and line below
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping for moving lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-k> :call <SID>swap_up()<CR>
noremap <silent> <c-j> :call <SID>swap_down()<CR>
