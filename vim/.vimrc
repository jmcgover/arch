set mouse=a
set expandtab " :retab fixes everything!
set tabstop=3
set shiftwidth=3
set number
set textwidth=79
set clipboard=unnamed
set backup
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

" Use Solarized color scheme
syntax on 
set background=dark
colorscheme solarized

set foldcolumn=0
"Pasting On OSX
"vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
"nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p
call togglebg#map("<F5>")

" lhs comments

map ,# :s/^/#/<CR>:nohlsearch<CR>
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ,> :s/^/> /<CR>:nohlsearch<CR>
map ," :s/^/\"/<CR>:nohlsearch<CR>
map ,% :s/^/%/<CR>:nohlsearch<CR>
map ,! :s/^/!/<CR>:nohlsearch<CR>
map ,; :s/^/;/<CR>:nohlsearch<CR>
map ,- :s/^/--/<CR>:nohlsearch<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
 map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
 map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
 map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
 map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

",# shell, perl, etc
",/ c++
",> email quote
"," vim
",% latex, prolog
",! assembly/X-resources
",; scheme
",- sql, ada
",c clears any of the previous comments


set foldcolumn=1

au BufWinEnter *.* set foldmethod=marker  "set fold method to marker
au BufWinEnter *.* set foldmarker===>,<== "set fold markers
",* c
",( Standard ML
",< html
",d clears any of the wrapping comments

"If the cursor is not on a valid character 
"(for example, at the end of a line),
"it will still be moved back one character (unless virtual-edit mode is
"enabled).
"If you are in paste mode and hit <Esc>, the cursor will still be moved back
"one character (since all mappings are ignored in paste mode).
"inoremap <silent> <Esc> <C-O>:stopinsert<CR>


if has("autocmd")
	" Enable file type detection
	" Use the default feiltype settings, so that mail gets 'tw' set to 72
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent
	" indenting
	filetype plugin indent on
	" ...
endif

au FileType sh set textwidth=0 wrapmargin=0
