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

" placeholder in vim
nnoremap zz <Esc>/<++><CR>:nohlsearch<CR>c4l
nnoremap ,. <Esc>a<++><Esc>
iabbrev ,. <++>

nnoremap zx :nohlsearch<CR>

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
