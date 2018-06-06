" Tim Jones' vimrc
" jonestim.com
" You may or may not find this useful

" Let's have line numbers and syntax highlighting
set number
syntax on


" tabs - two characters, spaces only
" actual tab characters are 4 characters, 
" so you can spot them!
" Also, let tabs exist in Makefiles
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
set noexpandtab
else
set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab
endif



" cursor can go anywhere in command mode
set virtualedit=all

" Search as you type, oh yeah!
set incsearch

" Get the column number etc in the bottom right
set ruler

" Uncomment if you want mouse support. 
" Not so good on a remote system, of course
" set mouse=a

" ctags for a pleasant developing environment
" F8 builds the tags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Stuff for golang
filetype indent on

