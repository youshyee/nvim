let mapleader=" "
nnoremap <Space> <Nop>
" Map leader to which_key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual  '<Space>'<CR>
" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=500

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
			\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Single mappings
let g:which_key_map['['] = [ 'bprevious'                  , 'previous-buffer' ]
let g:which_key_map[']'] = [ 'bnext'                      , 'next-buffer' ]
let g:which_key_map['b'] = [':Buffers'                    , 'open buffers']
let g:which_key_map['c'] = [ ':set spell!'                , 'spell check']
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['k'] = [ ':call Show_documentation()' , 'show doc']
let g:which_key_map['l'] = [ ':Lines'                     , 'line search' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'              , 'ranger' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'            , 'undo tree']
let g:which_key_map['y'] = [ ':CocList -A --normal yank'  , 'yank list']
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

" Group mappings
" a is for actions
let g:which_key_map.a = {
			\ 'name' : '+actions' ,
			\ 'A' : ['<Plug>(coc-codeaction-selected)' , 'coc vaction']             ,
			\ 'M' : [':InstantMarkdownStop'            , 'md preview stop']         ,
			\ 'P' : [':call Pandocmd2beamer()'         , 'get beamer']              ,
			\ 'V' : [':Codi!'                          , 'codi off']                ,
			\ 'a' : ['<Plug>(coc-codeaction)'          , 'coc action']              ,
			\ 'd' : [':Bdelete'                        , 'delete buffer']           ,
			\ 'm' : [':InstantMarkdownPreview'         , 'md preview']              ,
			\ 'p' : [':call Getpdf()'                  , 'get pdf']                 ,
			\ 'r' : [':call CompileRunGcc()'           , 'run']                     ,
			\ 's' : [':let @/ = ""'                    , 'remove search highlight'] ,
			\ 't' : [':TableModeToggle'                , 'table mode!']             ,
			\ 'v' : [':Codi'                           , 'codi on']                 ,
			\ }

" d is for debug
let g:which_key_map.d = {
			\ 'name' : '+debug' ,
			\ 'R' : [':call vimspector#Restart()'                  , 'restart' ]              ,
			\ 'S' : [':call vimspector#StepOut()'                  , 'stepout' ]              ,
			\ 'b' : [':call vimspector#ToggleBreakpoint()'         , 'toggle breakpoint']     ,
			\ 'c' : ['<Plug>VimspectorToggleConditionalBreakpoint' , 'condition breakpoint' ] ,
			\ 'd' : [':call vimspector#Continue()'                 , 'continue' ]             ,
			\ 'e' : ['<Plug>VimspectorBalloonEval'                 , 'evaluate' ]             ,
			\ 'l' : [':call vimspector#Launch()'                   , 'Launch']                ,
			\ 'o' : [':call vimspector#StepOver()'                 , 'step over' ]            ,
			\ 'q' : [':call vimspector#Reset()'                    , 'stop' ]                 ,
			\ 'r' : [':call vimspector#RunToCursor()'              , 'runto' ]                ,
			\ 's' : [':call vimspector#StepInto()'                 , 'stepinto' ]             ,
			\ 'w' : [':call vimspector#AddWatch()'                 , 'add watch']             ,
			\ }

" w is for window
let g:which_key_map.w = {
			\ 'name' : '+window' ,
			\ 'b' : ['<C-W>s'                             , 'split below'],
			\ 'r' : ['<C-W>v'                             , 'split right'],
			\ '=' : ['<C-W>='                             , 'balance windows' ],
			\ 't' : [':tabe'                             , 'new tab'],
			\ 'w' : [':MaximizerToggle'                             , 'toggle wind max'],
			\ 's' : [':call WindowSwap#EasyWindowSwap()'  ,'swap window'],
			\ }

" s is for search
let g:which_key_map.s = {
			\ 'name' : '+search' ,
			\ '/' : [':History/'              , 'history'],
			\ ';' : [':Commands'              , 'commands'],
			\ 'a' : [':Ag'                    , 'text Ag'],
			\ 'b' : [':BLines'                , 'current buffer'],
			\ 'c' : [':Commits'               , 'commits'],
			\ 'C' : [':BCommits'              , 'buffer commits'],
			\ 'f' : [':Files'                 , 'files'],
			\ 'g' : [':GFiles'                , 'git files'],
			\ 'G' : [':GFiles?'               , 'modified git files'],
			\ 'h' : [':History'               , 'file history'],
			\ 'H' : [':History:'              , 'command history'],
			\ 'l' : [':Lines'                 , 'lines'] ,
			\ 'm' : [':Marks'                 , 'marks'] ,
			\ 'M' : [':Maps'                  , 'normal maps'] ,
			\ 'p' : [':Helptags'              , 'help tags'] ,
			\ 'P' : [':Tags'                  , 'project tags'],
			\ 's' : [':CocList snippets'      , 'snippets'],
			\ 'S' : [':Colors'                , 'color schemes'],
			\ 't' : [':Rg'                    , 'text Rg'],
			\ 'T' : [':BTags'                 , 'buffer tags'],
			\ 'w' : [':Windows'               , 'search windows'],
			\ 'y' : [':Filetypes'             , 'file types'],
			\ 'z' : [':FZF'                   , 'FZF'],
			\ }

" g is for git
let g:which_key_map.g = {
			\ 'name' : '+git'                         ,
			\ 'a' : [':Git add .'                     , 'add all']         ,
			\ 'A' : [':Git add %'                     , 'add current']     ,
			\ 'b' : [':Git blame'                     , 'blame']           ,
			\ 'B' : [':GBrowse'                       , 'browse']          ,
			\ 'D' : [':Git diff'                      , 'diff']            ,
			\ 'd' : [':Gdiffsplit'                    , 'diff split']      ,
			\ 'f' : [':GitGutterFold'                 , 'hunk fold']       ,
			\ 'g' : [':GGrep'                         , 'git grep']        ,
			\ 'H' : [':GitGutterLineHighlightsToggle' , 'highlight hunks'] ,
			\ 'h' : ['<Plug>(GitGutterPreviewHunk)'   , 'preview hunk']    ,
			\ 'i' : [':CocList gitignore'             , 'gitignore']       ,
			\ 'j' : ['<Plug>(GitGutterNextHunk)'      , 'next hunk']       ,
			\ 'k' : ['<Plug>(GitGutterPrevHunk)'      , 'prev hunk']       ,
			\ 'l' : [':Git log'                       , 'log']             ,
			\ 'm' : [':vert Git commit -av'           , 'message']         ,
			\ 'p' : [':AsyncRun git push'             , 'push']            ,
			\ 'o' : [':AsyncRun gmp'                  , 'autopush']        ,
			\ 'P' : [':AsyncRun git pull'             , 'pull']            ,
			\ 'S' : ['<Plug>(GitGutterStageHunk)'     , 'stage hunk']      ,
			\ 's' : [':Gstatus'                       , 'status']          ,
			\ 't' : [':GitGutterSignsToggle'          , 'toggle signs']    ,
			\ 'u' : ['<Plug>(GitGutterUndoHunk)'      , 'undo hunk']       ,
			\ }

" p is for language server protocol
let g:which_key_map.j = {
			\ 'name' : '+lsp' ,
			\ '.' : [':CocConfig'                          , 'config'],
			\ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
			\ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
			\ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
			\ 'b' : [':CocNext'                            , 'next action'],
			\ 'B' : [':CocPrev'                            , 'prev action'],
			\ 'c' : [':CocList commands'                   , 'commands'],
			\ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
			\ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
			\ 'e' : [':CocList extensions'                 , 'extensions'],
			\ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
			\ 'F' : ['<Plug>(coc-format)'                  , 'format'],
			\ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
			\ 'I' : [':CocList diagnostics'                , 'diagnostics'],
			\ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
			\ 'l' : [':CocList'         , 'Coclist'],
			\ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
			\ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
			\ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
			\ 'O' : [':CocList outline'                    , 'outline'],
			\ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
			\ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
			\ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
			\ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
			\ 'R' : ['<Plug>(coc-references)'              , 'references'],
			\ 's' : [':CocList -I symbols'                 , 'references'],
			\ 'S' : [':CocList snippets'                   , 'snippets'],
			\ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
			\ 'u' : [':CocListResume'                      , 'resume list'],
			\ 'U' : [':CocUpdate'                          , 'update CoC'],
			\ 'z' : [':CocDisable'                         , 'disable CoC'],
			\ 'Z' : [':CocEnable'                          , 'enable CoC'],
			\ }

" t is for terminal
let g:which_key_map.t = {
			\ 'name' : '+terminal' ,
			\ 'f' : [':FloatermNew fzf'                               , 'fzf'],
			\ 'g' : [':FloatermNew tig'                           , 'git'],
			\ 'h' : [':FloatermNew htop'                           , 'htop'],
			\ 'n' : [':FloatermNew node'                              , 'node'],
			\ 'p' : [':FloatermNew ipython'                            , 'python'],
			\ 'm' : [':FloatermNew neomutt'                           , 'mail'],
			\ 'r' : [':FloatermNew ranger'                            , 'ranger'],
			\ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
			\ 't' : [':FloatermToggle'                                , 'toggle'],
			\ 'v' : [':vsplit term://fish'                                , 'vsplit term'],
			\ }

" T is for terminal
let g:which_key_map.T = {
			\ 'name' : '+tabline' ,
			\ 'b' : [':XTabListBuffers'         , 'list buffers'],
			\ 'd' : [':XTabCloseBuffer'         , 'close buffer'],
			\ 'D' : [':XTabDeleteTab'           , 'close tab'],
			\ 'h' : [':XTabHideBuffer'          , 'hide buffer'],
			\ 'i' : [':XTabInfo'                , 'info'],
			\ 'l' : [':XTabLock'                , 'lock tab'],
			\ 'm' : [':XTabMode'                , 'toggle mode'],
			\ 'n' : [':tabNext'                 , 'next tab'],
			\ 'N' : [':XTabMoveBufferNext'      , 'buffer->'],
			\ 't' : [':tabnew'                  , 'new tab'],
			\ 'p' : [':tabprevious'             , 'prev tab'],
			\ 'P' : [':XTabMoveBufferPrev'      , '<-buffer'],
			\ 'x' : [':XTabPinBuffer'           , 'pin buffer'],
			\ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
"
"==========================key====================================
