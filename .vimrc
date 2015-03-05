"Vundle init
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Bundles

" Powerline
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set laststatus=2
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set guifont=Inconsolata\ for\ Powerline
let g:Powerline_symbols = 'fancy'
set t_Co=256

" Fugitive (g + git command in prompt)
Bundle 'tpope/vim-fugitive'

" Nerdtree (file browser)
Bundle 'scrooloose/nerdtree'
map <F3> :NERDTreeToggle<CR>

" Syntastic
Bundle 'scrooloose/syntastic'
" Syntastic config
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_post_args='--ignore=E501'
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

function! FindCabalSandboxRoot()
    return finddir('.cabal-sandbox', './;')
endfunction

function! FindCabalSandboxRootPackageConf()
    return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
endfunction

let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']
let g:syntastic_haskell_hdevtools_args = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()
let g:hdevtools_options = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()

" Python mode
Bundle 'klen/python-mode'
"NO Linting - let syntastic deal with that
let g:pymode_lint = 0


" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function
" ]]            Jump on next class or function
" [M            Jump on previous class or method
" ]M            Jump on next class or method
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


filetype plugin indent on

set number
syntax enable

" Set to auto read when a file is changed from the outside
set autoread

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

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

set colorcolumn=120
