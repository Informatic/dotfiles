""" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""" Vundle plugins
Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-powerline'
set laststatus=2
let g:Powerline_symbols = 'fancy'

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.py[co]$', '\.o$', '\.obj$', '\.elf$', '\.hex$']

Plugin 'kien/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*.pyo
set wildignore+=*.o
set wildignore+=*.elf
set wildignore+=*.hex
set wildignore+=*/_build/*
set wildignore+=*/node_modules/*

Plugin 'tacahiroy/ctrlp-funky'
Plugin 'vim-scripts/wombat256.vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

Plugin 'jplaut/vim-arduino-ino'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'chase/vim-ansible-yaml'
Plugin 'ciaranm/detectindent'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-unimpaired'

call vundle#end()

""" Coding style
set tabstop=4
set softtabstop=4
set shiftwidth=4
let g:detectindent_preferred_indent = 4

set smarttab
set expandtab
let g:detectindent_preferred_expandtab = 1

filetype plugin indent on


""" Keyboard
" F2 will toggle the "paste mode" (disabled indentation)
set pastetoggle=<F2>

" Map <Leader> to ,
let mapleader = ","

" Better indentation (keep selection, single < > keystroke indents one level)
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


""" Behaviour
" Mouse support
set mouse=a

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Jump to last position in file on load
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") 
    \ | exe "normal! g'\"" | endif

au BufReadPost * :DetectIndent

""" Appearance
syntax on

" 256-color support
set t_Co=256
color wombat256mod

" Showing line numbers and length
set number  " show line numbers
set tw=80   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" Colorize document width column
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Highlight cursor line
set cursorline

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

""" Addons
" ====================
" FIXME: delegate to separate file/plugin
" Simple "Run" command
if ! exists("*RunWith")
    function RunWith (command)
        execute "w"
        execute "!clear;time " . a:command . " " . expand("%")
    endfunction

    autocmd FileType python nmap ,t :call RunWith("python")<CR>
    autocmd FileType coffee nmap ,t :call RunWith("coffee")<CR>
    autocmd FileType ruby   nmap ,t :call RunWith("ruby")<CR>
endif

