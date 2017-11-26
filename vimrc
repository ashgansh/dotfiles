"Enable mouse
set mouse=a
"
" Use X windows clipboard
set clipboard=unnamedplus



" Vundle
set nocompatible              " required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fleischie/vim-styled-components'
Plugin 'godlygeek/tabular'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'heavenshell/vim-prettier'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jamessan/vim-gnupg'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jparise/vim-graphql'
Plugin 'mileszs/ack.vim'
Plugin 'mxw/vim-jsx'
Plugin 'nvie/vim-flake8'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'trevordmiller/nova-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vimwiki/vimwiki'
Plugin 'w0rp/ale'

call vundle#end()            " required
" ale
let &runtimepath.=',~/.vim/bundle/ale'

silent! helptags ALL
filetype plugin indent on    " required


colorscheme nova
"
" Python pep8
au Filetype python:
    \ set tabstop=4 | 
    \ set softtabstop=4 |
    \ set shiftwidth=4 | 
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



set encoding=utf-8

" Direct split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-F> <C-W><C-_>

" Natural Split
set splitbelow
set splitright


" Highlighting
let python_highlight_all=1
syntax on

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Line numbers
set rnu
set nu

" 256 colors
set t_Co=256

" Disable safe write
" Can prevent some watchers to NOT trigger when you change the files
set backupcopy=yes
"
" Change .swp location
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

" Toggle Paste mode
set pastetoggle=<F2>

" search combine ignore + smart to enable smart searching
set incsearch
set hlsearch
set ignorecase
set smartcase

hi Search cterm=underline ctermfg=NONE ctermbg=NONE
hi Visual cterm=reverse ctermbg=black
hi CursorLine ctermfg=white 

" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" JSX syntax highlighting on .js files
let g:jsx_ext_required = 0


" Forbid usage of arrowkeys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop> 

" Using backspace to delete in insert mode on mac
set backspace=indent,eol,start

" Launch NERDTree at startup
map <F3> :NERDTreeToggle<CR>
" Exit NERDTree if it's the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Get rid of the pipes in vim splits
set fillchars+=vert:\ 

" Hide Vertical Bar
hi VertSplit ctermfg=black 

"Highlight current line
set cursorline

" Nerdtree
let NERDTreeMinimalUI=1
let NERDTreeHighlightCursorline=0
let NERDTreeIgnore=['node_modules', '\.pyc$']
let NERDTreeWinSize=20

" Default Indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set autoindent
set wrap
set formatoptions=n1
" Deactivate message at vim startup
set shortmess+=I

" Filename completion like bash
set wildmode=longest,list,full


" Size of windows
" Use - to make smaller
" Use _ to make bigger
noremap <silent> _ :exe "resize " . (winheight(0) * 3/2)<CR>
noremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>


" Hide gitignore
let g:ctrlp_user_command = [
  \ '.git/', 'cd %s && git ls-files -oc . --exclude-standard', 'find %s -type f'
  \]

autocmd InsertEnter,InsertLeave * set cul!

nmap <F4> :NERDTreeFind<CR>

" Easy sudo save
cmap w!! w !sudo tee > /dev/null %

" INLINE LINTING/TYPE CHECKING/FORMATTING
let g:ale_linters = {
\  'javascript': ['eslint', 'flow', 'prettier'],
\}
let g:ale_fixers = {
\  'javascript': ['eslint', 'prettier'],
\}

" The code can be formatted using ALEFix
 let g:ale_javascript_prettier_use_local_config = 1
