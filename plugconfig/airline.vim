
" ===
" === airline.vim
" ===
let g:airline_powerline_fonts = 1
let g:airline_section_x = '%{ScrollStatus()} '
let g:airline_section_y = airline#section#create_right(['filetype'])
let g:airline_section_z = airline#section#create([
            \ '%#__accent_bold#%3l%#__restore__#/%L', ' ',
            \ '%#__accent_bold#%3v%#__restore__#/%3{virtcol("$") - 1}',
            \ ])

" let s:IA  = [ '#4e4e4e' , s:guibg  , 239 , s:termbg  , '' ]
" let s:IA2 = [ '#4e4e4e' , s:guibg2 , 239 , s:termbg2 , '' ]
" let g:airline#themes#simple#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA2, s:IA2)
