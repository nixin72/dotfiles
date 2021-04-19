""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" PACKAGE MANAGEMENT """"""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.local/share/nvim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'wakatime/vim-wakatime'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) }}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'

    " On-demand loading
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" BASIC CONFIGURATION """""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" COLOR SCHEME """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:onedark_termcolors=24
syntax on
colorscheme onedark

let g:lightline = { 'colorscheme': 'onedark' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" Workman layout """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source: https://axiomatic.neophilus.net/workman-layout-for-vim/

" (Y)ank -> (H)aul
" Search (N)ext -> (J)ump
" (E)nd word -> brea(K) of word [yeah, that one's a push...]
" (O)pen new line -> (L)ine

function Workman()
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
endfunction

function Qwerty()
  noremap o l
  noremap l o
  noremap O L
  noremap L O
  noremap n j
  noremap j n
  noremap N J
  noremap J N
  noremap gj gn
  noremap gn gj
  noremap e k
  noremap k e
  noremap E K
  noremap K <nop>
  noremap ge gk
  noremap gk ge
  noremap y h
  noremap y h
  noremap h y
  noremap Y H
  noremap H Y
endfunction

