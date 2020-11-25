set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'w0rp/ale'
call vundle#end()

" colors
colorscheme badwolf

" syntax
syntax enable

" tab
set tabstop=4
set softtabstop=4
set expandtab

" ui configs
set number
set showcmd
set cursorline
set lazyredraw
set showmatch
filetype indent on

" search options
set incsearch
set hlsearch
set ignorecase

" set korean incodings
set encoding=utf-8
set termencoding=utf-8

" mouse config
set mouse=a

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='fruit_punch'
set laststatus=2 " turn on bottom bar

" for nerdtree
map <C-n> :NERDTreeToggle<CR>

" key mappings
map <C-Tab> :bn
map <C-S-Tab> :bp
