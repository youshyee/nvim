" ===
" === startify
" ===

let g:startify_custom_header = [
\ '    __        __   _                            ____  _      _                   _',
\ '    \ \      / /__| | ___ ___  _ __ ___   ___  |  _ \(_) ___| |__   __ _ _ __ __| |',
\ '     \ \ /\ / / _ \ |/ __/ _ \| |_ ` _ \ / _ \ | |_) | |/ __| |_ \ / _` | |__/ _` |',
\ '      \ V  V /  __/ | (_| (_) | | | | | |  __/ |  _ <| | (__| | | | (_| | | | (_| |',
\ '       \_/\_/ \___|_|\___\___/|_| |_| |_|\___| |_| \_\_|\___|_| |_|\__,_|_|  \__,_|',
\ ]

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
			\ ]

let g:startify_enable_special = 0
