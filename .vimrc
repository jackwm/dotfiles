" use vim settings first
set nocompatible

color slate

" change the mapleader from \ to ,
let mapleader=","

" text
set title
set spell

" files
set nobackup
set undofile

" searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
set lines=48 columns=84

" scrolling
set scrolloff=5
set nu " line numbers
set relativenumber
set guioptions-=R
set guioptions-=r
set guioptions-=T
set guioptions-=l
set guioptions-=L
"
" autosave
au FocusLost * :wa

" yank to OS clipboard
nmap <leader>y "*y
nmap <leader>p "*p
nmap <leader>P "*P

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" pull word under cursor into LHS of a substitute
nmap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" sudo to write
cmap w!! w !sudo tee % >/dev/null

" tab completion
set wildmenu
set wildmode=list:full
set wildignore=*.swp,*.bak

" tabs are 2 spaces except in makefiles
set sw=2
set ts=2
set expandtab
set smarttab
set softtabstop=2
autocmd FileType make setlocal noexpandtab

" these settings are needed for latex-suite
filetype indent on
filetype plugin on
filetype on
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
" disable smart quotes
let g:Tex_SmartQuoteOpen='"'
let g:Tex_SmartQuoteClose='"'

map <leader>tc <esc>i<F9>
map <leader>te <esc>i<F5>
map <leader>tp :TPackage
map <leader>ts :TSection

set iskeyword+=:

" disable arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" buffers
map <A-Left> :bprevious!<CR>
map <A-Right> :bnext!<CR>
map <A-Up> :buffers<CR>
map <A-Down> :bmodified!<CR>
map <A-End> :bdelete!<CR>
map <A-PageUp> :bfirst!<CR>
map <A-PageDown> :blast!<CR>
map <leader>q :bdelete<cr>

" vsplit
map <leader>vs :set columns=167<cr>\|:vsplit<cr>

" XML indentation
map <leader>ix <Esc>:1,$!xmllint --format -<cr>

" CSS sort properties
nnoremap <leader>cs ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" re-hardwrap paragraph text
nnoremap <leader>wp gqip

" git
nnoremap <leader>gst :Gstatus<cr>
nnoremap <leader>gcm :Gcommit<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gmv :Gmove<cr>

" ruby
map <leader>rr :w<cr>\|:!ruby %<cr>
map <leader>rs :w<cr>\|:!rake start<cr>
map <leader>sp :w<cr>\|:!rspec %<cr>
map <leader>rc :w<cr>\|:!lessc assets/stylesheets/styles.less > public/stylesheets/styles.css<cr>

" latex
map <leader>al i\begin{align}<cr><cr>\end{align} <Esc>k
map <leader>seq i\begin{subequations}<cr><cr>\end{subeqations} <Esc>k
map <leader>mp i\begin{minipage}{0.5\linewidth}<cr><cr>\end{minipage} <Esc>k
map <leader>eq i\begin{equation}<cr><cr>\end{equation} <Esc>k
map <leader>dn i\begin{Definition}[]<cr>\leavevmode\newline<cr><cr>\end{Definition} <Esc>kkklll
map <leader>tm i\begin{Theorem}[]<cr>\leavevmode\newline<cr><cr>\end{Theorem} <Esc>kkklll

map <leader>m :w<cr>\|:!./maketex<cr>

" sessions
nmap SS :wa<cr>:mksession! ~/.vimsessions/
nmap SO :wa<cr>:so ~/.vimsessions/

call pathogen#infect()

" completion
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType ruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby let g:rubycomplete_buffer_loading=1
" autocmd FileType ruby let g:rubycomplete_classes_in_global=1


