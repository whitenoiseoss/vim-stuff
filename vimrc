set nocompatible

" python hacks
if has('python') " if dynamic py|py3, this line already activates python2.
  let s:python_version = 2
elseif has('python3')
  let s:python_version = 3
else
  let s:python_version = 0
endif

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Base Editor plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Shougo/neocomplete'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'

" Color
Plugin 'flazz/vim-colorschemes'

" Python
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/pydoc.vim'
Plugin 'nvie/vim-flake8'

" Go
Plugin 'fatih/vim-go'

" JSON
Plugin 'elzr/vim-json'

" AWS
Plugin 'm-kat/aws-vim'
call vundle#end()

" Color Scheme
colorscheme gruvbox
set background=dark

if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

filetype plugin indent on

let mapleader = ','

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

" Vim-Go
let g:go_fmt_command = "goimports"

" Ultisnip
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger=""
let g:did_UltiSnips_vim_after = 1
let g:UltiSnipsSnippetDirectorties = ["UltiSnips"]

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#sources#syntax#min_keyword_length = 3
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd BufWritePost *.py call Flake8()

" Define dictionaries
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

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

" Automated search for classes and methods
" Python
command WNpyfc :execute "noautocmd vimgrep /class " . expand("<cword>") . "/j **/*." . expand("%:e") | cw
command WNpyfm :execute "noautocmd vimgrep /def " . expand("<cword>") . "/j **/*." . expand("%:e") | cw

" Find
map <Leader>f /
map <Leader>fn //<CR>

" NERDTree
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
" let NERDTreeShowBookmarks=1
" let NERDTreeDirArrowExpandable = "+"
" let NERDTreeDirArrowCollapsible = "-"
map <F3> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree Coloring
hi Directory guifg=#FF0000 ctermfg=172

" Taglist
" let Tlist_Ctags_Cmd='/usr/bin/ctags'
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Close_On_Select = 1
" let Tlist_Use_Right_Window = 1
" let Tlist_File_Fold_Auto_Close = 1
" let Tlist_WinWidth = 50
" map <F2> :TlistToggle<CR>

" Tagbar
nmap <F2> :TagbarToggle<CR>

" Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-]>'
let g:multi_cursor_prev_key='<C-[>'
let g:multi_cursor_skip_key='<C-\>'
let g:multi_cursor_quit_key='<Esc>'

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if has('unix')
    let g:syntastic_error_symbol='★'
    " fancy symbols for syntax checker
    let g:syntastic_error_symbol='✗'
    let g:syntastic_style_error_symbol='>'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_style_warning_symbol='>'
else
    let g:syntastic_error_symbol='!'
    let g:syntastic_style_error_symbol='>'
    let g:syntastic_warning_symbol='.'
    let g:syntastic_style_warning_symbol='>'
endif

" Syntastic disable python
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" Syntastic JavaScript
let g:syntastic_javascript_checkers = ['gjslint']
let g:syntastic_gjslint_conf=" --nojsdoc"
