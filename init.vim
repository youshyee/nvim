"             _
"  _ ____   _(_)_ __ ___
" | '_ \ \ / / | '_ ` _ \
" | | | \ V /| | | | | | |
" |_| |_|\_/ |_|_| |_| |_|
"
" Author: xinyu

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
set clipboard=unnamedplus
let &t_ut=''
set autochdir

" set vim as default pager
" let $PAGER=''

" ===
" === Editor behavior
" ===
syntax on
set number
set hidden          " Required to keep multiple buffers open multiple buffers
set pumheight=10    " Makes popup menu smaller
set cmdheight=2     " More space for displaying messages
set laststatus=2    " Always display the status line
set background=dark " tell vim what the background color looks like
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" automaticaly delects all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

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


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
noremap ; :

" Save & quit
noremap Q :q<CR>
"noremap <C-q> :qa<CR>
noremap S :w<CR>
" Alternate way to save
nnoremap <silent> <C-s> :w<CR>
" Alternate way to quit
nnoremap <silent> <C-q> :q<CR>

" Copy to system clipboard
" vnoremap Y "+y
" nnoremap P "+p

" Better indenting
vnoremap < <gv
vnoremap > >gv

" join lines
noremap <bar> :join!<CR>

" === Cursor Movement

" Move selected line / block of text in visual mode
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
nnoremap K 5k
nnoremap J 5j
" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b
" redo command
noremap U :redo<CR>

" Better window navigation
imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l

tnoremap <C-n> <C-\><C-n> " this line will lead to esc not function in fzf previewer

" " Press ` to change case (instead of ~)
noremap ` ~

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize +2<CR>
nnoremap <silent> <M-k>    :resize -2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" === Tab management
" ===
" Create a new tab with tu
" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>
noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt
noremap <M-0> 10gt

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===

"
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Compile function
noremap <C-R> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
		" elseif &filetype == 'vim'
		"		exec "w"
		"		exec ":source $MYVIMRC"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

func! Pandocmd2beamer()
	if &filetype == 'markdown'
		exec "w"
		exec"!pandoc % -f markdown -t beamer -o %<.pdf"
	endif
endfunc

func! Pandocmd2pdf()
	if &filetype == 'markdown'
		exec "w"
		exec"!pandoc % -f markdown -t pdf -o %<.pdf"
	endif
endfunc

func! Getpdf()
	if &filetype == 'markdown'
		:call Pandocmd2pdf()
	elseif &filetype == 'tex'
		exec "w"
		exec "!pdflatex %"
		exec "!rm %<.aux %<.log"
	endif
endfunc

" noremap <C-\> :call Getpdf()<CR>

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Change dates fast using <c-a> and <c-x> can change data
Plug 'tpope/vim-speeddating'
" Repeat stuff
Plug 'tpope/vim-repeat'
Plug 'RRethy/vim-illuminate'
" auto set indent settings
Plug 'tpope/vim-sleuth'
" Better Syntax Support
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter' " change cwd to project dir
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
"Plug 'junkblocker/git-time-lapse'
"
" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'ajmwagar/vim-deus'
Plug 'crusoexia/vim-dracula'
" Swap windows
Plug 'wesQ3/vim-windowswap'

" Genreal Highlighter
" Plug 'jaxbot/semantic-highlight.vim'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "c-f find in files c-l find in line
Plug 'kevinhwang91/rnvimr' "<lead>+R run ranger

" Taglist
" Plug 'liuchengxu/vista.vim'

" Debugger
"Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'} " too many of them explain later

" Snippets
" Plug 'SirVer/ultisnips' "  # to do
Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree' " <leader>u toggle undotree
" Git
Plug 'tpope/vim-fugitive'
" Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/vim-gist'

" Tex
Plug 'lervag/vimtex'

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
" Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'
" Interactive code
Plug 'metakirby5/codi.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown'] }
Plug 'dkarter/bullets.vim'

" html
" Closetags
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'

" Other filetypes
Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" Editor Enhancement
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'moll/vim-bbye'
Plug 'tomtom/tcomment_vim' " in <space>/ to comment a line or <space>; to comment inline
Plug 'theniceboy/antovim' "  'gs' to switch true to false
Plug 'tpope/vim-surround' " type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'godlygeek/tabular' " :Tabularize <regex> to align
Plug 'easymotion/vim-easymotion' " toggle ' quick locate by letter
" Plug 'Konfekt/FastFold'
Plug 'svermeulen/vim-subversive' " use ss to replace line with place holder <++> use s<motion> to replace with <++>
Plug 'rhysd/clever-f.vim'  "use f + letter to locate quickly forward, F + letter backward
" Terminal
Plug 'voldikss/vim-floaterm'
" Plug 'terryma/vim-multiple-cursors'

" Formatter
Plug 'Chiel92/vim-autoformat' "format text by \f

" For general writing
Plug 'junegunn/goyo.vim' " toggle <leader>gy go to zenmode
Plug 'ap/vim-css-color'

" Bookmarks
"Plug 'kshenoy/vim-signature'
Plug 'MattesGroeger/vim-bookmarks' "toggle book mark mm bookmark annotation ma bookmark show all ml

" Find & Replace
" Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] } "find and replace by f
" Plug 'osyo-manga/vim-anzu' "search by n

" Files
Plug 'tpope/vim-eunuch'

" See what keys do like in emacs
Plug 'liuchengxu/vim-which-key'

Plug 'mhinz/vim-startify'

" Other visual enhancement
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'wincent/terminus'

" Other useful utilities
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
Plug 'makerj/vim-pdf'

" Dependencies
Plug 'kana/vim-textobj-user'

call plug#end()

" experimental
set lazyredraw
"set regexpengine=1


" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set background=light
"set cursorcolumn

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70
"==========================key====================================

let mapleader=" "
nnoremap <Space> <Nop>
" Map leader to which_key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual  '<Space>'<CR>
" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=500

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
			\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

nnoremap zz <Esc>/<++><CR>:nohlsearch<CR>c4l
nnoremap ,. <Esc>a<++><Esc>
inoremap ,. <++>
" Single mappings
let g:which_key_map['.'] = [ ':Commands'                          , 'commands' ]
let g:which_key_map['['] = [ 'bprevious'                             , 'previous-buffer' ]
let g:which_key_map[']'] = [ 'bnext'                             , 'next-buffer' ]
let g:which_key_map['c'] = [ ':set spell!'                        , 'spell check']
let g:which_key_map['d'] = [ ':Bdelete'                        , 'delete-buffer']
let g:which_key_map['f'] = [ ':Files'                             , 'search files' ]
let g:which_key_map['l'] = [ ':Lines'               , 'line search' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'                      , 'ranger' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                    , 'undo tree']
let g:which_key_map['y'] = [ ':CocList -A --normal yank'     , 'yank list']
let g:which_key_map['k'] = [ ':call Show_documentation()'     , 'show doc']
let g:which_key_map['z'] = [ 'Goyo'                               , 'zen' ]

" Group mappings
" a is for actions
let g:which_key_map.a = {
			\ 'name' : '+actions' ,
			\ 'a' : ['<Plug>(coc-codeaction)'              , 'coc action'],
			\ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'coc vaction'],
			\ 'p' : [':call Getpdf()'    , 'get pdf'],
			\ 'r' : [':call CompileRunGcc()'    , 'run'],
			\ 'P' : [':call Pandocmd2beamer()'    , 'get beamer'],
			\ 't' : [':TableModeToggle'    , 'table mode!'],
			\ 's' : [':let @/ = ""'            , 'remove search highlight'],
			\ 'v' : [':Codi'                   , 'codi on'],
			\ 'V' : [':Codi!'                  , 'codi off'],
			\ }

" w is for window
let g:which_key_map.w = {
			\ 'name' : '+window' ,
			\ 'b' : ['<C-W>s'                             , 'split below'],
			\ 'r' : ['<C-W>v'                             , 'split right'],
			\ '=' : ['<C-W>='                             , 'balance windows' ],
			\ 't' : [':tabe'                             , 'new tab'],
			\ 'm' : [':call WindowSwap#EasyWindowSwap()'  ,'move window'],
			\ }


" k is for task
" let g:which_key_map.k = {
"				\ 'name' : '+task' ,
"				\ 'c' : [':AsyncTask file-compile'      , 'compile file'],
"				\ 'b' : [':AsyncTask project-build'     , 'build project'],
"				\ 'e' : [':AsyncTaskEdit'               , 'edit local tasks'],
"				\ 'f' : [':AsyncTaskFzf'                , 'find task'],
"				\ 'g' : [':AsyncTaskEdit!'              , 'edit global tasks'],
"				\ 'h' : [':AsyncTaskList!'              , 'list hidden tasks'],
"				\ 'l' : [':CocList tasks'               , 'list tasks'],
"				\ 'm' : [':AsyncTaskMacro'              , 'macro help'],
"				\ 'o' : [':copen'                       , 'open task view'],
"				\ 'r' : [':AsyncTask file-run'          , 'run file'],
"				\ 'p' : [':AsyncTask project-run'       , 'run project'],
"				\ 'x' : [':cclose'                      , 'close task view'],
"				\ }

" s is for search
let g:which_key_map.s = {
			\ 'name' : '+search' ,
			\ '/' : [':History/'              , 'history'],
			\ ';' : [':Commands'              , 'commands'],
			\ 'a' : [':Ag'                    , 'text Ag'],
			\ 'b' : [':BLines'                , 'current buffer'],
			\ 'B' : [':Buffers'               , 'open buffers'],
			\ 'c' : [':Commits'               , 'commits'],
			\ 'C' : [':BCommits'              , 'buffer commits'],
			\ 'f' : [':Files'                 , 'files'],
			\ 'g' : [':GFiles'                , 'git files'],
			\ 'G' : [':GFiles?'               , 'modified git files'],
			\ 'h' : [':History'               , 'file history'],
			\ 'H' : [':History:'              , 'command history'],
			\ 'l' : [':Lines'                 , 'lines'] ,
			\ 'm' : [':Marks'                 , 'marks'] ,
			\ 'M' : [':Maps'                  , 'normal maps'] ,
			\ 'p' : [':Helptags'              , 'help tags'] ,
			\ 'P' : [':Tags'                  , 'project tags'],
			\ 's' : [':CocList snippets'      , 'snippets'],
			\ 'S' : [':Colors'                , 'color schemes'],
			\ 't' : [':Rg'                    , 'text Rg'],
			\ 'T' : [':BTags'                 , 'buffer tags'],
			\ 'w' : [':Windows'               , 'search windows'],
			\ 'y' : [':Filetypes'             , 'file types'],
			\ 'z' : [':FZF'                   , 'FZF'],
			\ }
" \ 's' : [':Snippets'     , 'snippets'],

" g is for git
let g:which_key_map.g = {
			\ 'name' : '+git' ,
			\ 'a' : [':Git add .'                        , 'add all'],
			\ 'A' : [':Git add %'                        , 'add current'],
			\ 'b' : [':Git blame'                        , 'blame'],
			\ 'B' : [':GBrowse'                          , 'browse'],
			\ 'd' : [':Git diff'                         , 'diff'],
			\ 'D' : [':Gdiffsplit'                       , 'diff split'],
			\ 'f' : [':GitGutterFold'                    , 'hunk fold'],
			\ 'g' : [':GGrep'                            , 'git grep'],
			\ 'G' : [':Gstatus'                          , 'status'],
			\ 'H' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
			\ 'h' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
			\ 'i' : [':CocList gitignore'                , 'gitignore'],
			\ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
			\ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
			\ 'l' : [':Git log'                          , 'log'],
			\ 'm' : [':vert Git commit -av'             , 'message'],
			\ 'p' : [':AsyncRun git push'                         , 'push'],
			\ 'o' : [':AsyncRun gmp'                         , 'autopush'],
			\ 'P' : [':AsyncRun git pull'                         , 'pull'],
			\ 'r' : [':GRemove'                          , 'remove'],
			\ 'S' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
			\ 's' : [':!git status'                      , 'status'],
			\ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
			\ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
			\ }

" let g:which_key_map.G = {
"				\ 'name' : '+gist' ,
"				\ 'a' : [':Gist -a'                          , 'post gist anon'],
"				\ 'b' : [':Gist -b'                          , 'post gist browser'],
"				\ 'd' : [':Gist -d'                          , 'delete gist'],
"				\ 'e' : [':Gist -e'                          , 'edit gist'],
"				\ 'l' : [':Gist -l'                          , 'list public gists'],
"				\ 's' : [':Gist -ls'                         , 'list starred gists'],
"				\ 'm' : [':Gist -m'                          , 'post gist all buffers'],
"				\ 'p' : [':Gist -P'                          , 'post public gist '],
"				\ 'P' : [':Gist -p'                          , 'post private gist '],
"				\ }

" p is for language server protocol
let g:which_key_map.j = {
			\ 'name' : '+lsp' ,
			\ '.' : [':CocConfig'                          , 'config'],
			\ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
			\ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
			\ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
			\ 'b' : [':CocNext'                            , 'next action'],
			\ 'B' : [':CocPrev'                            , 'prev action'],
			\ 'c' : [':CocList commands'                   , 'commands'],
			\ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
			\ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
			\ 'e' : [':CocList extensions'                 , 'extensions'],
			\ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
			\ 'F' : ['<Plug>(coc-format)'                  , 'format'],
			\ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
			\ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
			\ 'I' : [':CocList diagnostics'                , 'diagnostics'],
			\ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
			\ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
			\ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
			\ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
			\ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
			\ 'O' : [':CocList outline'                    , 'outline'],
			\ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
			\ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
			\ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
			\ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
			\ 'R' : ['<Plug>(coc-references)'              , 'references'],
			\ 's' : [':CocList -I symbols'                 , 'references'],
			\ 'S' : [':CocList snippets'                   , 'snippets'],
			\ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
			\ 'u' : [':CocListResume'                      , 'resume list'],
			\ 'U' : [':CocUpdate'                          , 'update CoC'],
			\ 'z' : [':CocDisable'                         , 'disable CoC'],
			\ 'Z' : [':CocEnable'                          , 'enable CoC'],
			\ }

" t is for terminal
let g:which_key_map.t = {
			\ 'name' : '+terminal' ,
			\ 'f' : [':FloatermNew fzf'                               , 'fzf'],
			\ 'g' : [':FloatermNew tig'                           , 'git'],
			\ 'h' : [':FloatermNew htop'                           , 'htop'],
			\ 'n' : [':FloatermNew node'                              , 'node'],
			\ 'p' : [':FloatermNew ipython'                            , 'python'],
			\ 'm' : [':FloatermNew neomutt'                           , 'mail'],
			\ 'r' : [':FloatermNew ranger'                            , 'ranger'],
			\ 't' : [':FloatermToggle'                                , 'toggle'],
			\ }

" T is for terminal
let g:which_key_map.T = {
			\ 'name' : '+tabline' ,
			\ 'b' : [':XTabListBuffers'         , 'list buffers'],
			\ 'd' : [':XTabCloseBuffer'         , 'close buffer'],
			\ 'D' : [':XTabDeleteTab'           , 'close tab'],
			\ 'h' : [':XTabHideBuffer'          , 'hide buffer'],
			\ 'i' : [':XTabInfo'                , 'info'],
			\ 'l' : [':XTabLock'                , 'lock tab'],
			\ 'm' : [':XTabMode'                , 'toggle mode'],
			\ 'n' : [':tabNext'                 , 'next tab'],
			\ 'N' : [':XTabMoveBufferNext'      , 'buffer->'],
			\ 't' : [':tabnew'                  , 'new tab'],
			\ 'p' : [':tabprevious'             , 'prev tab'],
			\ 'P' : [':XTabMoveBufferPrev'      , '<-buffer'],
			\ 'x' : [':XTabPinBuffer'           , 'pin buffer'],
			\ }


" Register which key map
call which_key#register('<Space>', "g:which_key_map")
"
"==========================key====================================
"
" ===================== Start of Plugin Settings =====================

" python
" Syntax highlighting
let g:python_highlight_all=1

" ===
" === airline.vim
" ===
let g:airline_powerline_fonts = 1


" ==
" == GitGutter
" ==
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap \gf :GitGutterFold<CR>
nnoremap \h :GitGutterPreviewHunk<CR>
nnoremap \- :GitGutterPrevHunk<CR>
nnoremap \= :GitGutterNextHunk<CR>

" ===
" === vim-fugitive
" ===
nnoremap \gb :Gblame<CR>
" ===
" === coc
" ===
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = [
			\'coc-python',
			\ 'coc-sh',
			\ 'coc-texlab',
			\'coc-vimtex',
			\'coc-html',
			\'coc-json',
			\'coc-snippets',
			\'coc-yank',
			\'coc-gitignore',
			\'coc-vimlsp',
			\'coc-lists',
			\'coc-git',
			\'coc-explorer',
			\'coc-sourcekit',
			\'coc-translator',
			\'coc-yaml',
			\'coc-actions',
			\'coc-diagnostic',
			\'coc-prettier',
			\'coc-syntax',
			\'coc-eslint',
			\'coc-tsserver']

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <silent><expr> <c-space> coc#refresh()

function! Show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Open up coc-commands
nnoremap <c-c> :CocCommand<CR>

" Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
"		execute 'CocCommand actions.open ' . a:type
" endfunction
"
" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" coc yank list

"
" coc explore
nmap tt :CocCommand explorer<CR>
"
" coc-translator
nmap ts <Plug>(coc-translator-p)

" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'Xinyu Yang'
" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_browser = "chromium"

" ===
" === vim-table-mode
" ===
" noremap <LEADER>tm <CR>
let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'
" ===
" === FZF
" ===
" set rtp+=/usr/bin/fzf

" This is the default extra key bindings
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
"-g '!{node_modules,.git}'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)


" Get text in files with Rg
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   "rg --column --line-number --no-heading --color=always --smart-case --glob '!.git/**' ".shellescape(<q-args>), 1,

" Make Ripgrep ONLY search file contents and not filenames
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
			\   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
			\           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
			\   <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
			\ call fzf#vim#grep(
			\   'git grep --line-number '.shellescape(<q-args>), 0,
			\   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" ===
" === codi
" ===
highlight CodiVirtualText guifg='#98C379'

let g:codi#virtual_text_prefix = "❯ "

let g:codi#aliases = {
			\ 'javascript.jsx': 'javascript',
			\ }

" ===
" === vim-bookmarks
" ===
let g:bookmark_no_default_key_mappings = 1
nmap mm <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll
nmap mn <Plug>BookmarkNext
nmap mp <Plug>BookmarkPrev
nmap mC <Plug>BookmarkClear
nmap mX <Plug>BookmarkClearAll
" nmap <Leader>g <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1

" ===
" === Undotree
" ===
" noremap <Leader>u :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

" ==
" == vim-multiple-cursor
" ==
" let g:multi_cursor_use_default_mapping = 0
" let g:multi_cursor_start_word_key = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<a-n>'
" let g:multi_cursor_start_key = '<C-N>'
" let g:multi_cursor_select_all_key = '<a-N>'
" let g:multi_cursor_next_key = '<C-n>'
" let g:multi_cursor_prev_key = '<C-p>'
" let g:multi_cursor_skip_key = '<C-x>'
" let g:multi_cursor_quit_key = '<Esc>'



" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]


" ===
" === Vista.vim
" ===
" noremap <C-t> :silent! Vista finder coc<CR>
" let g:vista_default_executive = 'ctags'
" let g:vista_fzf_preview = ['right:50%']
" " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
" let g:vista#renderer#enable_icon = 1
"
" " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" let g:vista#renderer#icons = {
"				\   "function": "\uf794",
"				\   "variable": "\uf71b",
"				\  }
" function! NearestMethodOrFunction() abort
"		return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()



" ===
" === Ultisnips
" ===
" let g:UltiSnipsExpandTrigger="<C-l>"
" let g:UltiSnipsJumpForwardTrigger="C-m>"
" let g:UltiSnipsListSnippets="<C-m>"
" let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" let g:UltiSnipsEditSplit="tabdo"
let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" augroup ultisnips_no_auto_expansion
"     au!
"     au VimEnter * au! UltiSnips_AutoTrigger
" augroup END

" ===
" === closetag
" ===
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
			\ 'typescript.tsx': 'jsxRegion,tsxRegion',
			\ 'javascript.jsx': 'jsxRegion',
			\ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" ===
" === vimtex
" ===
"let g:vimtex_view_method = ''
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_mappings_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_motion_enabled = 0
let maplocalleader=' '


" ===
" === AutoFormat
" ===
nnoremap \f :Autoformat<CR>

" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
map ' <Plug>(easymotion-bd-f)
nmap ' <Plug>(easymotion-bd-f)


" ===
" === goyo
" ===
let g:goyo_width = 120
let g:goyo_linenr =10
let g:goyo_height ="90%"

" ===
" === fastfold
" ===
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1


" ===
" === tabular
" ===
vmap ta :Tabularize /


" ===
" === vim-after-object
" ===
"autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === rainbow parentheses
" ===
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow_conf = {'guis': ['bold']}
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
let g:rainbow_conf = {
			\	'guifgs': ['#858580', '#8FBCBB', '#D08770', '#A3BE8C', '#EBCB8B', '#B48EAD', '#80a880', '#887070'],
			\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
			\	'guis': [''],
			\	'cterms': [''],
			\	'operators': '_,_',
			\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
			\	'separately': {
			\		'*': {},
			\		'markdown': {
			\			'parentheses_options': 'containedin=markdownCode contained',
			\		},
			\		'lisp': {
			\			'guifgs': ['#858580', '#8FBCBB', '#D08770', '#A3BE8C', '#EBCB8B', '#B48EAD', '#80a880', '#887070'],
			\		},
			\		'jsx': {
			\			'guifgs': ['#858580', '#8FBCBB', '#D08770', '#A3BE8C', '#EBCB8B', '#B48EAD', '#80a880', '#887070'],
			\		},
			\		'haskell': {
			\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
			\		},
			\		'vim': {
			\			'parentheses_options': 'containedin=vimFuncBody',
			\		},
			\		'perl': {
			\			'syn_name_prefix': 'perlBlockFoldRainbow',
			\		},
			\		'stylus': {
			\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
			\		},
			\		'css': 0,
			\	}
			\}


" ===
" === rnvimr
" ===
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

let g:rnvimr_draw_border = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_pick_enable = 1

" Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_bw_enable = 1

" nmap <leader>r :RnvimrToggle<CR>

let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"'
" \ --cmd="set draw_borders separators"'

" let g:rnvimr_layout = { 'relative': 'editor',
"             \ 'width': float2nr(round(0.6 * &columns)),
"             \ 'height': float2nr(round(0.6 * &lines)),
"             \ 'col': float2nr(round(0.2 * &columns)),
"             \ 'row': float2nr(round(0.2 * &lines)),
"             \ 'style': 'minimal' }

let g:rnvimr_presets = [
			\ {'width': 0.800, 'height': 0.800}]

" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_lazy = 1
let g:xtabline_settings.show_right_corner = 0
let g:xtabline_settings.indicators = {
			\ 'modified': '+',
			\ 'pinned': '[📌]',
			\}
" \ 'modified': '●',

let g:xtabline_settings.icons = {
			\'pin': '📌',
			\'star': '*',
			\'book': '📖',
			\'lock': '🔒',
			\'hammer': '🔨',
			\'tick': '✔',
			\'cross': '✖',
			\'warning': '⚠',
			\'menu': '☰',
			\'apple': '🍎',
			\'linux': '🐧',
			\'windows': '⌘',
			\'git': '',
			\'palette': '🎨',
			\'lens': '🔍',
			\'flag': '🏁',
			\}
noremap \p :XTabInfo<CR>

" ===
" === polyglot.vim
" ===
" let g:polyglot_disabled = ['csv']

let g:python_highlight_all=1

let g:vim_jsx_pretty_colorful_config = 1

set re=0

" ===
" === context.vim
" ===
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>


" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%



" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===
" === vim-subversive
" ===
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)

" ===
" === bullets
" ===
let g:bullets_mapping_leader = 'z'

" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 550
hi illuminatedWord cterm=undercurl gui=undercurl
let g:Illuminate_ftblacklist = ['nerdtree']
let g:Illuminate_ftwhitelist = ['vim', 'sh', 'python']
let g:Illuminate_highlightUnderCursor = 0 " no highlight undercursor word


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']

" ===
" === startify
" ===

let g:startify_custom_header = [
			\ '        _   ___    ________          __   ',
			\ '       / | / / |  / / ____/___  ____/ /__ ',
			\ '      /  |/ /| | / / /   / __ \/ __  / _ \',
			\ '     / /|  / | |/ / /___/ /_/ / /_/ /  __/',
			\ '    /_/ |_/  |___/\____/\____/\__,_/\___/ ',
			\]

let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
			\ { 'type': 'files',     'header': ['   Files']                        },
			\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
			\ { 'type': 'sessions',  'header': ['   Sessions']                     },
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
			\ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
	return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_bookmarks = [
			\ { 'i': '~/.config/i3/config' },
			\ { 'v': '~/.config/nvim/init.vim' },
			\ { 'f': '~/.config/fish/config.fish' },
			\ '~/Pics',
			\ ]

let g:startify_enable_special = 0

" ===
" === AsyncRun
" ===
noremap \gp :AsyncRun git push<CR>

" urlview
" noremap <C-u> :sp !urlview<CR> %

" ===
" === AsyncTasks
" ===
let g:asyncrun_open = 6
let g:asynctasks_term_pos = 'bottom'
" let g:asynctasks_term_pos = 'top'
" let g:asynctasks_term_pos = 'tab'
" let g:asynctasks_term_pos = 'external'
let g:asynctasks_extra_config = ['~/.config/nvim/utils/tasks.ini']
" let current_tasks = asynctasks#list("")

function! s:fzf_sink(what)
	let p1 = stridx(a:what, '<')
	if p1 >= 0
		let name = strpart(a:what, 0, p1)
		let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
		if name != ''
			exec "AsyncTask ". fnameescape(name)
		endif
	endif
endfunction

function! s:fzf_task()
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	let opts = { 'source': source, 'sink': function('s:fzf_sink'),
				\ 'options': '+m --nth 1 --inline-info --tac' }
	if exists('g:fzf_layout')
		for key in keys(g:fzf_layout)
			let opts[key] = deepcopy(g:fzf_layout[key])
		endfor
	endif
	call fzf#run(opts)
endfunction

command! -nargs=0 AsyncTaskFzf call s:fzf_task()

" ===
" === window-swap
" ===
let g:windowswap_map_keys = 0 "prevent default bindings

" ===
" === tcomment_vim
" ===
let g:tcomment_maps = 0 " no preload comment
vmap z/ :TComment<CR>
noremap z/ :TComment<CR>
nmap z; :TCommentRight<CR>
" ===
" === floatterm
" ===


" let g:floaterm_wintype='normal'
" let g:floaterm_height=6

let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" ===================== End of Plugin Settings =====================
" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

" over ride
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
