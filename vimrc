set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/pydoc.vim'

Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'

Plugin 'flazz/vim-colorschemes'
call vundle#end()

" Color Scheme
colorscheme Monokai

if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

filetype plugin indent on

set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set number

set incsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8
set tabstop=8 shiftwidth=4 softtabstop=4 expandtab
set listchars=tab:▒░,trail:▓
set list

inoremap <C-U> <C-G>u<C-U>

set number
set hlsearch
set ignorecase
set smartcase

" Don't use Ez mode, use Q for formatting
map Q gq

if has('mouse')
	set mouse=a
endif

set hidden

" TODO: Fix this
noremap  <C-S> :w<CR>
vnoremap <C-S> <C-C>:w<CR>
inoremap <C-S> <Esc>:w<CR>

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" Exit insert mode
inoremap <C-c> <Esc>

set completeopt=menuone,longest,preview

"
" Plugin configuration
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.pyc/*

" Ultisnip
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger=""
let g:did_UltiSnips_vim_after = 1
let g:UltiSnipsSnippetDirectorties = ["UltiSnips"]

" SuperTab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"
" Basic shortcut definitions
"

" Indent/Unindent
vnoremap <C-i> >
vnoremap <C-u> <

" Quicker ESC
inoremap jk <Esc>

" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}

vmap <C-w> S

nnoremap <C-z> :undo<CR>
inoremap <C-z> <Esc>:undo<CR>
nnoremap <C-y> :redo<CR>
inoremap <C-y> <Esc>:redo<CR>

" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

let mapleader = ','
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>

nnoremap <Leader>q :qall<CR>

" Panes
map <C-H> <C-W>h<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_

" Comment
vmap <Leader>c gc

" Find
map <Leader>f /
map <Leader>fn //<CR>

" NERDTree
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
" let NERDTreeShowBookmarks=1
" let NERDTreeDirArrowExpandable = "+"
" let NERDTreeDirArrowCollapsible = "-"
map <F3> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree Coloring
hi Directory guifg=#FF0000 ctermfg=148

" Taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
map <F7> :TlistToggle<CR>
