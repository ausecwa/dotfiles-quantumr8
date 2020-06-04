""""""""""""""""""""""""""""""
" => Vim plugin manager
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary.git'
Plug 'jiangmiao/auto-pairs'
Plug 'maximbaz/lightline-ale'
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
" => Linter settings
""""""""""""""""""""""""""""""
" let g:ale_sign_error = "\uf05e"
" let g:ale_sign_warning = "\uf071"
" let g:ale_set_highlights = 0
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear SignColumn
highlight clear ALESignColumnWithoutErrors
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_list_window_size = 5
let g:ale_python_pylint_use_global = 0
let g:ale_python_pylint_options = '--disable=C0103'

let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fixers = {'python': ['autopep8', 'yapf']}
let g:ale_warn_about_trailing_whitespace = 0

" linter in lightline
let g:lightline = {}
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
"set colors
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

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
      \   'right': [ ['lineinfo'], ['percent'], ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'] ]
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

""""""""""""""""""""""""""""""
" => Key bindings
""""""""""""""""""""""""""""""
command W execute 'silent w !sudo tee % > /dev/null' | :edit!
command Lint execute 'ALELint'
command Disablel execute 'ALEDisable'
command Enablel execute 'ALEEnable'

nmap <silent> <C-j> <Plug>(ale_next)
nmap <silent> <C-k> <Plug>(ale_previous)

