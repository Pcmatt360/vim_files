
" setup non-stupid tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" setup some things that should be default but aren't
set nu
set relativenumber
set noerrorbells
set nohlsearch
set hidden
set nowrap
set noswapfile
set nobackup
set undodir=/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set colorcolumn=80
set signcolumn=yes

let mapleader = " "

" arrow keys are for lusers.  lusers are on other people's systems
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Setup VimPlug stuff
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'editorconfig/editorconfig-vim'

" Initialize plugin system
call plug#end()

colorscheme nord

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ThePrimeagen "Credit Given Where Due.  Thanks!
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
