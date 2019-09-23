""""""""""""""""""""""""""""""
" => Vim plugin manager
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'jiangmiao/auto-pairs'
call plug#end()

""""""""""""""""""""""""""""""
" => Fold settings
""""""""""""""""""""""""""""""
set foldmethod=marker 
set foldnestmax=10
set nofoldenable
set foldlevel=2

""""""""""""""""""""""""""""""
" => Tab settings
""""""""""""""""""""""""""""""
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

""""""""""""""""""""""""""""""
" => Theme settings
""""""""""""""""""""""""""""""
set number
syntax on
" colorscheme monokai

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
set noshowmode

if !has('gui_running')
	set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding'] ]
      \ },
      \ }

""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""
" => Other settigns
""""""""""""""""""""""""""""""
let b:ale_linters = ['pyflakes', 'flake8', 'pylint']

""""""""""""""""""""""""""""""
" => Custom commands
""""""""""""""""""""""""""""""
command W :execute 'silent w !sudo tee % > /dev/null' | :edit!
