if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 


call plug#begin()
Plug 'tpope/vim-sensible'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""     My Edits to configuration          """"""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the default vim configuration stuff
runtime! archlinux.vim

" Add '.' key to be "Add a single character" 
:nmap <silent> . "=nr2char(getchar())<cr>P

" Set tabwidth and spaces 
set tabstop=4 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set smarttab

" Activate line numbers 
set number
set numberwidth=3
set relativenumber

" Set the vertical bars and line wrap settings
set wrap
set showbreak=\ \ ->\ \  " extra indent
set linebreak
set nolist 
set textwidth=100
set wrapmargin=0

set colorcolumn=80,100
highlight ColorColumn ctermbg=darkgrey 
