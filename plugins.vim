
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
Plug 'github/copilot.vim'

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
	" Plug 'vim-airline/vim-airline-themes'

	Plug 'ojroques/vim-scrollstatus'

	Plug 'bling/vim-bufferline'
	Plug 'ajmwagar/vim-deus'
	Plug 'crusoexia/vim-dracula'

	" Swap windows
	" Plug 'wesQ3/vim-windowswap'

	" Genreal Highlighter
	" Plug 'jaxbot/semantic-highlight.vim'

	" File navigation
	"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim' "c-f find in files c-l find in line
	" Plug 'kevinhwang91/rnvimr' "<lead>+R run ranger
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'

	" Taglist
	" Plug 'liuchengxu/vista.vim'

	" Debugger
	Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-python'}

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
	" Plug 'mattn/vim-gist'

	Plug 'szw/vim-maximizer'



	" Tex
	Plug 'lervag/vimtex'

	" Python
	" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
	" Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
	" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
	"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
	"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
	" Plug 'tweekmonster/braceless.vim'
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
	" Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

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



"
" ===================== Start of Plugin Settings =====================
source $HOME/.config/nvim/plugconfig/easymotion.vim
source $HOME/.config/nvim/plugconfig/subversive.vim

if exists('g:vscode') " vscode only
	source $HOME/.config/nvim/vscodesetting.vim
	source $HOME/.config/nvim/plugconfig/highlightyank.vim
endif
if !exists('g:vscode') " vim only
	source $HOME/.config/nvim/plugconfig/which-key.vim
	source $HOME/.config/nvim/plugconfig/airline.vim
	source $HOME/.config/nvim/plugconfig/gitgutter.vim
	source $HOME/.config/nvim/plugconfig/fugitive.vim
	source $HOME/.config/nvim/plugconfig/instantmarkdownpreview.vim
	source $HOME/.config/nvim/plugconfig/coc.vim
	source $HOME/.config/nvim/plugconfig/vimtablemode.vim
	source $HOME/.config/nvim/plugconfig/fzf.vim
	source $HOME/.config/nvim/plugconfig/codi.vim
	source $HOME/.config/nvim/plugconfig/vimbookmark.vim
	source $HOME/.config/nvim/plugconfig/undotree.vim
	source $HOME/.config/nvim/plugconfig/multicursor.vim
	source $HOME/.config/nvim/plugconfig/bullet.vim
	source $HOME/.config/nvim/plugconfig/ultisnips.vim
	source $HOME/.config/nvim/plugconfig/closetag.vim
	source $HOME/.config/nvim/plugconfig/vimtex.vim
	source $HOME/.config/nvim/plugconfig/goyo.vim
	source $HOME/.config/nvim/plugconfig/maximizer.vim
	source $HOME/.config/nvim/plugconfig/tabular.vim
	source $HOME/.config/nvim/plugconfig/rainbow.vim
	source $HOME/.config/nvim/plugconfig/ranger.vim
	source $HOME/.config/nvim/plugconfig/xtabline.vim
	source $HOME/.config/nvim/plugconfig/polyglot.vim
	" source $HOME/.config/nvim/plugconfig/suda.vim
	source $HOME/.config/nvim/plugconfig/markdowntoc.vim
	source $HOME/.config/nvim/plugconfig/bullets.vim
	source $HOME/.config/nvim/plugconfig/illuminate.vim
	source $HOME/.config/nvim/plugconfig/rooter.vim
	source $HOME/.config/nvim/plugconfig/startify.vim
	source $HOME/.config/nvim/plugconfig/asynctasks.vim
	source $HOME/.config/nvim/plugconfig/tcomment.vim
	source $HOME/.config/nvim/plugconfig/floatterm.vim

	" ===
	" === others
	" ===
	let g:windowswap_map_keys = 0 "prevent default bindings
	let g:AutoPairsMapSpace = 0 "prevent default bindings
	let g:python_highlight_all=1
endif

" ===================== End of Plugin Settings =====================
