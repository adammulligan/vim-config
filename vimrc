color jellybeans

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-endwise"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
Bundle "scrooloose/nerdcommenter"
Bundle "kien/ctrlp.vim"
Bundle "vim-scripts/grep.vim"
Bundle "ervandew/supertab"
Bundle "adammulligan/hardmode"
Bundle "vim-scripts/VimClojure"
Bundle "mortice/pbcopy.vim"
Bundle "tpope/vim-fugitive"

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

syntax enable
filetype plugin indent on

let mapleader = ","

set wrap
set linebreak
set textwidth=72
set nolist
set hidden

set nocompatible
set number
set ruler
set encoding=utf-8

set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

" List chars
set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " tabs as gaps
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " show > when line extends off screen (right)
set listchars+=precedes:<         " show < when line extends off screen (left)

set hlsearch
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

set backupdir=~/.vim/_backup//
set directory=~/.vim/_temp//
set undofile

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%] 
  set statusline+=Col:%v 
  set statusline+=Buf:#%n 
endif

" Stuff what I stole from janus

" sudo write
cmap w!! %!sudo tee > /dev/null %

nmap <silent> <leader>N :NERDTree<CR>

map <leader>N :NERDTree<CR>

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
