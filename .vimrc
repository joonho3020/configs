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
Plugin 'valloric/youcompleteme'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'universal-ctags/ctags'
call vundle#end()

" colors
colorscheme badwolf

" syntax
syntax enable

" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set expandtab

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

" for vim-lightline
set noshowmode
set laststatus=2 " turn on bottom bar
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='badwolf'

" tmux color
set term=screen-256color

" buffer setup
set hidden
set autowrite

" code folding
set foldmethod=manual

" ctags (jumping to def)
set tags=tags

" auto update ctags when a file is written
function! DelTagOfFile(file)
	let fullpath = a:file
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let f = substitute(fullpath, cwd . "/", "", "")
	let f = escape(f, './')
	let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
	let resp = system(cmd)
endfunction

function! UpdateTags()
	let f = expand("%:p")
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
	call DelTagOfFile(f)
	let resp = system(cmd)
endfunction

autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()


" -------------------------- Key Mappings ---------------------------

" Buffers - next/previous:ctrl-k / ctrl-k
nnoremap <silent> <C-k> :bn<CR>
nnoremap <silent> <C-j> :bp<CR>

" for nerdtree
map <C-n> :NERDTreeToggle<CR>


