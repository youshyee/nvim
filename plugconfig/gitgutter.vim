
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
