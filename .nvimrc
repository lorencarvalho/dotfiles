"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Loren's init.vim for neovim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ...

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basic Settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" easier paste mode
set pastetoggle=<F3>

" i like mice
set mouse=a

" make backspace behave like normal again
set bs=2

" always show status line
set ls=2

" .swp files, .swp files everywhere
set noswapfile
set nobackup
set nowritebackup

" tabs are spaces, ya dummy
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab

" faster update time
set updatetime=300

" can i still undo?
set undofile
set undodir=~/.undo
set history=700
set undolevels=700

" searching
set incsearch " incremental search
set hlsearch " highlight search results
set ignorecase
set smartcase

" other set defaults
set encoding=utf-8
set hidden " hide buffers instead of closing them
set autoread " read outside file changes into buffer
set scrolloff=2 " scroll buffer

" Split right & below
set splitbelow
set splitright

" comma leader
let mapleader = ","

" clear search results
nmap <silent> <leader>/ :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Look & Feel

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" colors
set t_Co=256
color Tomorrow-Night

" syntax highlighting
filetype off
filetype plugin indent on
syntax on
syntax enable

" line numbers and length
set number  " show line numbers
set tw=99   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=100
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show signcolumns

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Supertab
let g:SuperTabDefaultCompletionType = '<c-n>' " Top-down results

" NERDTree
map <F1> :NERDTreeToggle<CR>
let NERDTreeShowHidden=0 " set to 1 to enable
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '^__pycache__$[[dir]]']
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Close NERDTree if last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&
\ b:NERDTreeType == "primary") | q | endif

" Tagbar
let g:tagbar_autofocus = 1
map <F2> :TagbarToggle<CR>

" Airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1 " Use extensions!
let g:airline_theme = "tomorrow"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ 's'  : 'S',
    \ }

" coc
nmap <leader>g <Plug>(coc-definition)
nmap <leader>z <Plug>(coc-references)
nmap <leader>r <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" fzf
map <leader>b :Buffers<CR>
map <C-p> :Files<CR>
