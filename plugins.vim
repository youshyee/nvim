
" ===
" === Install Plugins with Vim-Plug
" ===
call plug#begin('~/.config/nvim/plugged')

" Change dates fast using <c-a> and <c-x> can change data
Plug 'tpope/vim-speeddating'
Plug 'rhysd/clever-f.vim'  "use f + letter to locate quickly forward, F + letter backward
Plug 'tomtom/tcomment_vim' " in <space>/ to comment a line or <space>; to comment inline
" Repeat stuff
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion' " toggle ' quick locate by letter
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'tpope/vim-surround' " type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'svermeulen/vim-subversive' " use ss to replace line with place holder <++> use s<motion> to replace with <++>

if exists('g:vscode')
	Plug 'machakann/vim-highlightedyank'
endif

if !exists('g:vscode')
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
	Plug 'ojroques/vim-scrollstatus'

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
	" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
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
	Plug 'theniceboy/antovim' "  'gs' to switch true to false
	Plug 'godlygeek/tabular' " :Tabularize <regex> to align
	" Plug 'Konfekt/FastFold'
	" Terminal
	Plug 'voldikss/vim-floaterm'
	" Plug 'terryma/vim-multiple-cursors'
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
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
endif

call plug#end()
