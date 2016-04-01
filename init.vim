" ### Vim-plug section

call plug#begin('~/.vim/plugged')

"Status bar
Plug 'https://github.com/vim-airline/vim-airline'
"Linters integration
Plug 'https://github.com/benekastah/neomake'
"Markdown support
Plug 'https://github.com/gabrielelana/vim-markdown'
"CtrlP
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

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
set smartcase

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
set noerrorbells
set nojoinspaces
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

"relative numbering, activated on leader + r
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Shortcuts for CtrlP
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>


