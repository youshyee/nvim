
" ===
" === codi
" ===
highlight CodiVirtualText guifg='#98C379'

let g:codi#virtual_text_prefix = "❯ "

let g:codi#aliases = {
			\ 'javascript.jsx': 'javascript',
			\ }
let g:codi#interpreters = {
                   \ 'python': {
                       \ 'bin': '/home/youshyee/.conda/envs/torch/bin/python',
                       \ 'prompt': '^\(>>>\|\.\.\.\) ',
                       \ },
                   \ }
