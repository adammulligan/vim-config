color jellybeans

syntax enable
filetype plugin indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-endwise"
Bundle "vim-ruby/vim-ruby"
Bundle "janx/vim-rubytest"
Bundle "jpalardy/vim-slime"
Bundle "tpope/vim-rails"
Bundle "scrooloose/nerdcommenter"
Bundle "kien/ctrlp"
Bundle "wikitopian/hardmode"

let mapleader = ","

let g:slime_target = "tmux"

map <Leader>\ <Plug>RubyTestRun     " change from <Leader>t to <Leader>\
map <Leader>] <Plug>RubyFileRun     " change from <Leader>T to <Leader>]
map <Leader>/ <Plug>RubyTestRunLast " change from <Leader>l to <Leader>/

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

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

" Toggle paste mode
nmap <silent> <F2> :set invpaste<CR>:set paste?<CR>
imap <silent> <F2> <ESC>:set invpaste<CR>:set paste?<CR>

nmap <silent> <leader>N :NERDTree<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

map <leader>N :NERDTree<CR>

" Underline the current line with =
nnoremap <leader>1 yypVr=

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Reselect pasted text
nnoremap <leader>v V`]
