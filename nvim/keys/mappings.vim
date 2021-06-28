
" Leader
let mapleader=" "       " leader is space

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" faster Scroll
nnoremap <C-e> 10<C-e>
xnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
xnoremap <C-y> 10<C-y>

" move btw buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" for nerdtree
map <C-n> :NERDTreeToggle<CR>

