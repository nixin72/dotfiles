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
    Plug 'jimmay5469/vim-spacemacs'
    Plug 'tpope/vim-commentary'
    Plug 'dosimple/workspace.vim'

    "" Code help
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    "" Clojure
    Plug 'guns/vim-clojure-static'
    Plug 'guns/vim-clojure-highlight'
    Plug 'guns/vim-sexp' 
    Plug 'tpope/vim-sexp-mappings-for-regular-people'
    Plug 'tpope/vim-fireplace'
    Plug 'kien/rainbow_parentheses.vim'

    "" Theme
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'

    "" File/Buffer management 
    Plug 'junegunn/fzf.vim'
    Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" BASIC CONFIGURATION """""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add '.' key to be "Add a single character"
:nmap <silent> . "=nr2char(getchar())<cr>P

" Set tabwidth and spaces
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
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

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif 

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

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
"""""""""" Language support """""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

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
  noremap y h
  noremap H Y
  noremap Y H
  nmap <silent> <C-w>y :wincmd h<CR>
  nmap <silent> <C-w>n :wincmd j<CR>
  nmap <silent> <C-w>e :wincmd k<CR>
  nmap <silent> <C-w>o :wincmd l<CR>
endfunction

function Qwerty()
  noremap o o
  noremap l l
  noremap O O
  noremap L L
  noremap n n
  noremap j j
  noremap N N
  noremap J J
  noremap gj gj
  noremap gn gn
  noremap e e
  noremap k k
  noremap E E
  noremap K <nop>
  noremap ge ge
  noremap gk gk
  noremap y y
  noremap h h
  noremap Y Y
  noremap H H
endfunction

" Select qwerty or workman depending on if my keyboard is plugged in
if system("moonlander") != ""
  :echo "Workman"
  call Workman()
else 
  :echo "Qwerty"
  call Qwerty()
endif

nnoremap <space>0 :CocCommand explorer<CR>

nnoremap <space>, <C-^>
nnoremap <space>b, <C-^>
nnoremap <space>bd :Sayonara!<CR>
nnoremap <space>bn :bnext<CR>
nnoremap <space>bN :enew<CR>
nnoremap <space>bp :bprevious<CR>
nnoremap <space>bi :Buffers<CR>

nnoremap <space>ft :CocCommand explorer<CR>
nnoremap <space>ff :GFiles<CR>

nnoremap <space>w1 :WS 1<CR>
nnoremap <space>w2 :WS 2<CR>
nnoremap <space>w3 :WS 3<CR>
nnoremap <space>w4 :WS 4<CR>

" Use K to show documentation in preview window
nnoremap <space>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
