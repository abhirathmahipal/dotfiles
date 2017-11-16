" Vi mode isn't required
set nocompatible
filetype off

" set the runtime path for so that it activates vim-plug
" A common place for windows, Linux and git subsystem's vim on Windows
set rtp+=~/.vim/autoloadvimplug

" Install plugins using vim-plug
call plug#begin('~/.vim/plugins')

" EJS files
Plug 'nikvdp/ejs-syntax'

" Surround cuz used to in VSCode
Plug 'tpope/vim-surround'
" Use emmet only for HTML and PHP
Plug 'mattn/emmet-vim',  { 'for': ['html', 'php', 'htmldjango', 'ejs'] }

" Help with navigation
Plug 'easymotion/vim-easymotion'

" Tree explorer. Lazy load
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Excellent plugin to comment stuff
Plug 'scrooloose/nerdcommenter'

" Status bar
Plug 'vim-airline/vim-airline'

" Tabularise data
Plug 'godlygeek/tabular'

" Paranthesis completion
" TODO search for a better plugin. auto-pairs has some issues
" with curly braces in Windows or alternatively use if statments or something
" and use different plugins for windows and linux
Plug 'jiangmiao/auto-pairs'

" Autocomplete
Plug 'Valloric/YouCompleteMe'

" Fuzzy search (like Sublime's file finder)
Plug 'ctrlpvim/ctrlp.vim'

" git
Plug 'tpope/vim-fugitive'

" Some colorschemes
Plug 'sjl/badwolf'
Plug 'dracula/vim'
Plug 'vim-scripts/peaksea' " Taken from Ultimate vimrc by amix
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'

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
set termguicolors

" for peaksea
" set background=dark
" colorscheme peaksea

" for ayucolor
let ayucolor="mirage"
" colorscheme ayu

" for base 16 colourscheme
colorscheme base16-default-dark

" Better styling for windows GUI
if has ("gui_running")
    if has("gui_win32")
        set guifont=Consolas:h12:cANSI:qDRAFT
        set guioptions-=m " Remove menubar
        set guioptions-=T " Remove toolbar
        set guioptions-=L " Remove scrollbars
        colorscheme dracula
    endif
endif

" Avoid delays while switching between modes
set timeoutlen=1000 ttimeoutlen=0  

" Title
" TODO Change edited file status to * from +
set title

" Status bar is always displayed. Useful for gvim
" TODO set modified file indicator to * from +
set laststatus=2

" Allow backspace everywhere and fix backspace issue
set backspace=indent,eol,start

" Reload when file changes externally (useful after git stash)
set autoread

" NerdComments settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" No backups please
set noswapfile
set nobackup
set nowb

" Replace tabs with spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4 " when backspace is pressed, remove four spaces if there was a tab

" When a line is created, autoindent stuff
set autoindent

" Show matching bracket
set showmatch

" search options
" smartcase ignores case when all small, case sensitive when there is caps
" Be careful about search. During replace, what is found by search is replaced
set smartcase
set hlsearch                                " Highlight all occurrences
set incsearch                               " Search as you type, incremental search
set ignorecase                              " ignore case while searching


" Toggle search highlights, http://stackoverflow.com/a/4372764/5698202
map <leader>h :set hlsearch!<cr>

" relative line number and highlight current line
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

" Ctrl + a is select all (Shrayas again)
nnoremap <C-a> ggVG

" Buffer switches
" Shows the list of buffers and waits for your input
" https://vi.stackexchange.com/questions/2129/fastest-way-to-switch-to-a-buffer-in-vim
nnoremap <leader>b :set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>
" Next Buffer
nnoremap <leader>n :bnext<CR>
" Prev Buffer
nnoremap <leader>p :bprev<CR>
" Last buffer edited
nnoremap <leader>e :e#<CR>

" Switch without saving buffers
set hidden


" Fugitive Specific Mapping (taken from Gokul)
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>


" Airline related config
let g:airline_theme='dark'
" let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" NERDTree settings

" VS Code uses Ctrl + Shift + e so
map <C-e> :NERDTreeToggle<CR>
