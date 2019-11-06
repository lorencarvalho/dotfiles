"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" loren's .vimrc, for neovim with coc.nvim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" basics

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

" better pane nav
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv
vnoremap > >gv

" Don't line wrap at 79 chars for git commit messages
autocmd Syntax gitcommit setlocal textwidth=0

" Delete all trailing whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" look n feel

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" colors
set t_Co=256

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

" If we are editing a markdown file, then wrapping it ok
autocmd BufNewFile,BufRead *.md set wrap
autocmd BufNewFile,BufRead *.rst set wrap

" Folding is for pizzas, not code
set nofoldenable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" plug

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'gabrielelana/vim-markdown'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Now that we've acquired the plugin, set the color
let g:enable_bold_font = 1
let g:enable_italic_font = 1
set background=dark
colorscheme hybrid_material

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
let g:airline_theme = "hybrid"
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1 " Use extensions!
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

nmap <leader>g <Plug>(coc-definition)
nmap <leader>z <Plug>(coc-references)
nmap <leader>r <Plug>(coc-rename)
map <leader>d :CocList diagnostics<CR>
map <leader>s :CocCommand python.sortImports<CR>

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

" Highlight word under cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" fzf
map <leader>b :Buffers<CR>
map <C-p> :Files<CR>

" markdown
let g:markdown_enable_spell_checking = 0

" bye
