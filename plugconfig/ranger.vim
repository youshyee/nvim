
" ===
" === rnvimr
" ===
" Make Ranger replace netrw and be the file explorer

"
" let g:rnvimr_ex_enable = 1
"
" let g:rnvimr_draw_border = 1
"
" " Make Ranger to be hidden after picking a file
" let g:rnvimr_pick_enable = 1
"
" " Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
" let g:rnvimr_bw_enable = 1
"
" " nmap <leader>r :RnvimrToggle<CR>
"
" let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"'
" " \ --cmd="set draw_borders separators"'
"
" " let g:rnvimr_layout = { 'relative': 'editor',
" "             \ 'width': float2nr(round(0.6 * &columns)),
" "             \ 'height': float2nr(round(0.6 * &lines)),
" "             \ 'col': float2nr(round(0.2 * &columns)),
" "             \ 'row': float2nr(round(0.2 * &lines)),
" "             \ 'style': 'minimal' }
"
" let g:rnvimr_presets = [
" 			\ {'width': 0.800, 'height': 0.800}]
"
" let g:rnvim_action= {'<C-t>': 'NvimEdit tabedit','gw': 'JumpNvimCwd','yw': 'EmitRangerCwd'}

" ===
" === ranger vim
" ===
" Make Ranger replace netrw and be the file explorer
"
" let g:ranger_command_override = 'ranger --cmd="set column_ratios 0.5,1"'
let g:ranger_map_keys = 0
let g:bclose_no_plugin_maps=1

let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
