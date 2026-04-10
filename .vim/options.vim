filetype plugin on
syntax on
set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set smartindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set ruler

set undolevels=1000
set backspace=indent,eol,start

set laststatus=2
set nocompatible
set noshowmode

set termguicolors

set rnu

set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal

colorscheme solarized8
set background=dark
" Fix buftabline colors to match Solarized Dark
highlight BufTabLineCurrent guibg=#073642 guifg=#2aa198 gui=bold  " Active buffer (Teal bg, Cyan text)
highlight BufTabLineActive  guibg=#002b36 guifg=#93a1a1           " Open but not focused
highlight BufTabLineHidden  guibg=#002b36 guifg=#586e75           " Background buffers
highlight BufTabLineFill    guibg=#001e26                         " Empty space in the bar
