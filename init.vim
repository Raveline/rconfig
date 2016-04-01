" ### Vim-plug section

call plug#begin('~/.vim/plugged')

"Status bar
Plug 'https://github.com/vim-airline/vim-airline'
"Linters integration
Plug 'https://github.com/benekastah/neomake'
"Markdown support
Plug 'https://github.com/gabrielelana/vim-markdown'

call plug#end()

" ### End Vim-plug section
"
" ### Neomake configuration section
"
" Python checker
let g:neomake_python_flake8_maker={'args': ['--ignore=E501']}
let g:neomake_python_enable_makers=['flake8']
" Haskell checkers
let g:neomake_haskell_hdevtools_maker={'args': ['-g-Wall']}
let g:neomake_haskell_hlint_maker={}
let g:neomake_haskell_enable_makers=['hdevtools', 'hlint']

"General options
let g:neomake_open_list=2

" Run neomake when saving
autocmd! BufWritePost * Neomake


" ### End Neomake configuration section


" W - sudo save
command W w !sudo tee % > /dev/null

" Gimme ruler
set ruler

" Case-insensitive search
set ignorecase

" Show matching brackets
set showmatch

set encoding=utf8

"I wanna ctrl+space
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
    if has("unix")
        inoremap <Nul> <C-n>
    else
    endif
endif


set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set wrap
set number
syntax enable

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:nnoremap <leader>jf :%!python -m json.tool<cr>
:nnoremap <leader>nn :bNext<cr>
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

set colorcolumn=120

filetype plugin indent on

colorscheme koehler
