if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 


call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'wakatime/vim-wakatime'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) }}

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""     My Edits to configuration          """"""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" Workman layout """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source: https://axiomatic.neophilus.net/workman-layout-for-vim/

" (Y)ank -> (H)aul
" Search (N)ext -> (J)ump
" (E)nd word -> brea(K) of word [yeah, that one's a push...]
" (O)pen new line -> (L)ine

noremap l o
noremap o l
noremap L O
noremap O L
noremap j n
noremap n j
noremap J N
noremap N J
noremap gn gj
noremap gj gn
noremap k e
noremap e k
noremap K E
noremap E <nop>
noremap gk ge
noremap ge gk
noremap h y
noremap h y
noremap y h
noremap H Y
noremap Y H

