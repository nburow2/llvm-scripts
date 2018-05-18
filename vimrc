:set expandtab
:set ic
:syntax on
:set shiftwidth=2
:set tabstop=2
:set number
:set autoindent
:set cindent
:set background=dark
:color desert
autocmd FileType tex set tw=80
autocmd FileType make setlocal noexpandtab
autocmd FileType c setlocal nospell
autocmd FileType cpp setlocal nospell
au BufRead,BufNewFile *.ll set filetype=ll
autocmd FileType ll setlocal nospell
:set spell spelllang=en_us
