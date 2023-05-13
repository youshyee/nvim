
"  __  __             _
" |  \/  |_   ___   _(_)_ __ ___  _ __ ___
" | |\/| | | | \ \ / / | '_ ` _ \| '__/ __|
" | |  | | |_| |\ V /| | | | | | | | | (__
" |_|  |_|\__, | \_/ |_|_| |_| |_|_|  \___|
"         |___/
" Author:  xinyu
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
	" color desert
	color deus
	" color molokai
	" color tokyonight
	" color darkplus
	" color gruvbox
	" color ayu
	" color xcodelighthc
	hi NonText ctermfg=gray guifg=grey10
	" exec AirlineTheme alduin
endif

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
nnoremap j gj
nnoremap k gk

