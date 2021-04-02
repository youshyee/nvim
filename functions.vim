
noremap <C-R> :call CompileRunGcc()<CR>
func! CompileRunGcc()
		exec "w"
		if &filetype == 'c'
			exec "!g++ % -o %<"
			exec "!time ./%<"
			" elseif &filetype == 'vim'
			"		exec "w"
			"		exec ":source $MYVIMRC"
		elseif &filetype == 'cpp'
			set splitbelow
			exec "!g++ -std=c++11 % -Wall -o %<"
			:sp
			:res -15
			:term ./%<
		elseif &filetype == 'java'
			exec "!javac %"
			exec "!time java %<"
		elseif &filetype == 'sh'
			:!time bash %
		elseif &filetype == 'python'
			set splitbelow
			:sp
			:term python3 %
		elseif &filetype == 'html'
			silent! exec "!".g:mkdp_browser." % &"
		elseif &filetype == 'markdown'
			exec "MarkdownPreview"
		elseif &filetype == 'tex'
			silent! exec "VimtexStop"
			silent! exec "VimtexCompile"
		elseif &filetype == 'javascript'
			set splitbelow
			:sp
			:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
		elseif &filetype == 'go'
			set splitbelow
			:sp
			:term go run .
		endif
endfunc

func! Pandocmd2beamer()
	if &filetype == 'markdown'
		exec "w"
		exec"!pandoc % -f markdown -t beamer -o %<.pdf"
	endif
endfunc

func! Pandocmd2pdf()
	if &filetype == 'markdown'
		exec "w"
		exec"!pandoc % -f markdown -t pdf -o %<.pdf"
	endif
endfunc

func! Getpdf()
	if &filetype == 'markdown'
		:call Pandocmd2pdf()
	elseif &filetype == 'tex'
		exec "w"
		exec "!pdflatex %"
		exec "!rm %<.aux %<.log"
	endif
endfunc
