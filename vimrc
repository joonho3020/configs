set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" VUNDLE FOR PLUGIN MANAGER
Plugin 'VundleVim/Vundle.vim'

" GUI RELATED PLUGINS
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/vim-slash'
Plugin 'severin-lemaignan/vim-minimap'

"" GIT GUI
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"Plugin 'xuyuanp/nerdtree-git-plugin' "incompatible issues in centos 8??

""" FOR COMMENTING
Plugin 'chrisbra/vim-commentary' 
    "usage : gcc (comment single line) gc+action(e.g. gcap)

" COLOR SCHEMES
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'

" SYNTATIC LANGUAGE SUPPORT
Plugin 'w0rp/ale'

" highlighting
Plugin 'yggdroot/indentline'
Plugin 'andymass/vim-matchup'
Plugin 'machakann/vim-highlightedyank'

" AUTO COMPLETE
" Plugin 'valloric/youcompleteme'
Plugin 'CmdlineComplete'


" JUMPING TO DEFINITION
Plugin 'jlanzarotta/bufexplorer'
Plugin 'universal-ctags/ctags'

" PLUGIN FOR SCALA
Plugin 'derekwyatt/vim-scala'

" PLUGIN FOR GO
Plugin 'fatih/vim-go'

call vundle#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark 
colorscheme gruvbox

" syntax
syntax enable

" tabs and spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" backspace to prev line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start

" ui configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number             " show line numbers
set relativenumber     " show relative numbering
set showcmd            " show command on bottom bar
set cursorline         " highlight current line
set showmatch          " show matching [{()}]
set wildmenu           " autocomplete for command line
set updatetime=100     " some plugins require fast update time
set ttyfast            " Improve redrawing
set mouse+=a           " mouse support - necessary evil
set encoding=utf-8     " set korean incodings
set termencoding=utf-8 " set korean incodings
set ttimeout           " key press time out
set ttimeoutlen=50     " is 50 ms
filetype indent on     " load filetype-specific indent files
filetype plugin on     " load filetype-specific plugin files


" search options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch          " search as characters are entered
set hlsearch           " highlight matches
set ignorecase         " ignore case
set smartcase          " but make it case sensitive if an uppercase in entered


" for vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode         " no show mode for default
set laststatus=2       " turn on bottom bar
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='badwolf'

" for indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_term = 243
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" tmux color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set term=screen-256color


" buffer setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden             " hide buffer
set autowrite          " for buffer autowrite


" code folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=manual


" ctags (jumping to def)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags

" minimap visual
let g:minimap_highlight='Visual'

" highlighted yank config for older vim
if !exists('##TextYankPost')
    map y <Plug>(highlightedyank)
endif

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" -------------------------- Key Mappings ---------------------------

" Buffers - next/previous : ctrl-k / ctrl-k
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <C-h> :bp<CR>

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" faster Scroll
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" for nerdtree
map <C-n> :NERDTreeToggle<CR>

" Leader
let mapleader=" "       " leader is space

"  y d p P   --  Quick copy paste into system clipboard
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" for minimap toggle
let g:minimap_toggle='<leader>mt'
