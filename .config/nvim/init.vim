if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'

" Elixir
Plug 'slashmili/alchemist.vim'

" Flutter
Plug 'thosakwe/vim-flutter'

" Suggestions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

noremap <c-l> <c-w><c-l>
noremap <c-h> <c-w><c-h>
noremap <c-k> <c-w><c-k>
noremap <c-j> <c-w><c-j>

" General configs
set clipboard=unnamedplus
set relativenumber number
let mapleader =","

" https://stackoverflow.com/a/4294176
"
" Create parent dirs for files, if they don't exist yet
"
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

" Deoplete
let g:deoplete#enable_at_startup = 1

" Emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,eelixir,leelixir EmmetInstall

" FLutter
autocmd FileType dart autocmd BufWritePost FlutterHotReload

" Nerd stuff
map <leader>n :NERDTreeToggle<CR>
map <leader>p :NERDTreeFind<CR>

" Tagbar
map <leader>m :TagbarToggle<CR>
