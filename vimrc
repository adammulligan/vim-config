set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-endwise"
Bundle "vim-ruby/vim-ruby"
Bundle 'plasticboy/vim-markdown'
Bundle 'elzr/vim-json'
Bundle "tpope/vim-rails"
Bundle "tpope/vim-bundler"
Bundle "scrooloose/nerdcommenter"
Bundle "kien/ctrlp.vim"
Bundle "vim-scripts/grep.vim"
Bundle "ervandew/supertab"
Bundle "adammulligan/hardmode"
Bundle 'chriskempson/base16-vim'
Bundle 'junegunn/goyo.vim'
Bundle 'morhetz/gruvbox'
Bundle 'sjl/gundo.vim'
Bundle 'alexbel/vim-rubygems'
Bundle 'tpope/vim-surround'
Bundle 'mattn/webapi-vim'
Bundle 'neilagabriel/vim-geeknote'

set background=dark
let g:gruvbox_italic=0
colorscheme gruvbox

syntax enable
filetype plugin indent on

let g:vim_markdown_folding_disabled=1
let g:goyo_width=80

let g:ctrlp_custom_ignore = 'node_modules\|plugins\|platforms\|\.git'
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

let mapleader = ","

set linebreak
set textwidth=72
set nolist
set hidden
set background=dark

set nocompatible
set number
set ruler
set encoding=utf-8
set pastetoggle=<F2>

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
  set statusline+=Line:\ %l/%L\ [%p%%]\ -
  set statusline+=\ Col:\ %v
endif

" sudo write
cmap w!! %!sudo tee > /dev/null %
command W w
command Wq wq

nmap <silent> <leader>N :NERDTree<CR>

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> " Strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

noremap <silent> <Space> :set hls!<CR>
nnoremap <leader>G :GundoToggle<CR>
nnoremap <leader>pp :tabe ~/tmp/project_notes.md<CR><leader>z
nnoremap <leader>t :Rake<CR>

" Hard Mode
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Distraction-free mode
nnoremap <silent> <leader>z :Goyo<cr>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
nmap <silent> <up> :cprev<CR>
nmap <silent> <down> :cnext<CR>
