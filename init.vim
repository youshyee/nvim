
"  __  __             _
" |  \/  |_   ___   _(_)_ __ ___  _ __ ___
" | |\/| | | | \ \ / / | '_ ` _ \| '__/ __|
" | |  | | |_| |\ V /| | | | | | | | | (__
" |_|  |_|\__, | \_/ |_|_| |_| |_|_|  \___|
"         |___/
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
" general settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/key.vim

" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" source functions
"
source $HOME/.config/nvim/functions.vim

source $HOME/.config/nvim/plugins.vim

if !exists('g:vscode') " vim only
	set termguicolors " enable true colors support
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	" color dracula
	" color one
	color deus
	" color gruvbox
	"color ayu
	"color xcodelighthc
	hi NonText ctermfg=gray guifg=grey10
endif
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
	source $HOME/.config/nvim/plugconfig/suda.vim
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
