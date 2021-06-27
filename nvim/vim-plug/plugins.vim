" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" File explorer
Plug 'scrooloose/NERDTree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ctrlpvim/ctrlp.vim'

" GUI RELATED PLUGINS
Plug 'junegunn/vim-slash'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'airblade/vim-gitgutter'

" FOR COMMENTING
Plug 'chrisbra/vim-commentary' 

" COLOR SCHEMES
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" HIGHLIGHTING
Plug 'yggdroot/indentline'
Plug 'andymass/vim-matchup'
Plug 'machakann/vim-highlightedyank'

" Language Server Protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()
