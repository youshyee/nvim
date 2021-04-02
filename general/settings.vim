
" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
set clipboard=unnamedplus
let &t_ut=''
set autochdir
set autoindent            " Good auto indent
set background=dark " tell vim what the background color looks like
" set cmdheight=2     " More space for displaying messages
set colorcolumn=100
set completeopt=longest,noinsert,menuone,noselect,preview
set cursorline

set foldenable
set foldlevel=99
set foldmethod=indent
" set formatoptions-=tc
set formatoptions-=cro                  " Stop newline continution of comments
set hidden          " Required to keep multiple buffers open multiple buffers

set ignorecase
set inccommand=split
set indentexpr=
set laststatus=2    " Always display the status line
set mouse=a                             " Enable your mouse
set nobackup                            " This is recommended by coc

set lazyredraw "same as above
set list
set listchars=tab:\|\ ,trail:▫
set noexpandtab
set noshowmode

set notimeout
set nowritebackup                       " This is recommended by coc

set number
set pumheight=10    " Makes popup menu smaller
set relativenumber
set scrolloff=8
set shiftwidth=2
set shortmess+=c
set showcmd
set smartcase
set smartindent                         " Makes indenting smart
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set splitbelow
set splitright
set tabstop=2
set ttimeoutlen=0
set ttyfast "should make scrolling faster
set tw=0
set t_Co=256                            " Support 256 colors
set updatetime=300
set viewoptions=cursor,folds,slash,unix
set virtualedit=block
set visualbell
set wildmenu
set wrap
syntax on

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.

if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" automaticaly delects all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
"
" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'
