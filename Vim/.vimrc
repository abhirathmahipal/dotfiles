" Vi mode isn't required
set nocompatible
filetype off

" set the runtime path for so that it activates vim-plug
" A common place for windows, Linux and git subsystem's vim on Windows
set rtp+=~/.vim/autoloadvimplug

" Install plugins using vim-plug
call plug#begin('~/.vim/plugins')


" Use emmet only for HTML and PHP
Plug 'mattn/emmet-vim',  { 'for': ['html', 'php'] }

" Help with navigation
Plug 'easymotion/vim-easymotion'

" Tree explorer. Lazy load
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Status bar
Plug 'vim-airline/vim-airline'

" Fuzzy search (like Sublime's file finder)
Plug 'ctrlpvim/ctrlp.vim'

" Some colorschemes
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'

call plug#end()
" end of vim-plug related stuff

" turning it on again
" load filetype-specific indent files & file specific plugins
filetype plugin indent on 
syntax enable

" Allow mouse
set mouse=a


" Allow 256 colours and theme
set t_Co=256
colorscheme molokai

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


" relative line number and highlight current line
set relativenumber " Thanks Shrayas :)
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
