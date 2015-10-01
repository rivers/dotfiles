call pathogen#infect()

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set nocompatible

set shell=/bin/bash

let mapleader = ","

" Scrolloff context
if !&scrolloff
  set scrolloff=10
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

" Colors
colorscheme vilight

if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Encoding
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" Search
set nohlsearch " no highlighting
set incsearch  " incremental searching
set ignorecase " make search case insensitive
set smartcase  " ci unless query contains capital letter

" Directories
set nobackup      " no backup files
set nowritebackup " no backup files while editing
set noswapfile    " no swap files

" Indentation, tabs, spaces, wrapping
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2 " autoindent spaces
set expandtab
set nowrap
set backspace=indent,eol,start
set complete-=i " disable slow include-based completion
set smarttab
set shiftround " round to nearest 2 spaces when shifting

" Wild menu
set wildmenu
set wildmode=list:longest,full

" History
set history=1000

" Misc display
set ruler
set laststatus=2 " always see mode, file name, file status, ruler, etc
set display+=lastline

" Sounds
set vb " visual bell

" Ain't nobody got time for <esc>
inoremap kj <esc>

" Expand %% to current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Execute current file
nnoremap <leader>r :!%:p<Enter>

" Disable ex mode
nnoremap Q <nop>

" List chars
set list!                  " Show invisible characters
set listchars=""           " Reset the listchars
set listchars=tab:\ \      " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.     " show trailing spaces as dots
set listchars+=extends:>   " The character to show in the last column when wrap is
                           " off and the line continues beyond the right of the screen
set listchars+=precedes:<  " The character to show in the last column when wrap is
                           " off and the line continues beyond the right of the screen

" Split navigation shortcuts
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Strip trailing whitespace
function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
command Strip call StripTrailingWhitespace()

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
end
