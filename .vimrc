""" Plug
set nocompatible
filetype off

call plug#begin('~/.vim/bundle')

""" Plug plugins
Plug 'bling/vim-airline'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }
let NERDTreeIgnore=['\.py[co]$', '\.o$', '\.obj$', '\.elf$', '\.hex$']

Plug 'kien/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*.pyo
set wildignore+=*.o
set wildignore+=*.elf
set wildignore+=*.hex
set wildignore+=*/_build/*
set wildignore+=*/node_modules/*

Plug 'vim-scripts/wombat256.vim'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"
let g:UltiSnipsEditSplit="vertical"

Plug 'ciaranm/detectindent'
Plug 'scrooloose/syntastic'

nmap <F7> :SyntasticCheck<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'tpope/vim-unimpaired'
Plug 'gregsexton/MatchTag'
Plug 'Valloric/YouCompleteMe'

call plug#end()

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

set viminfo='100,<500,s10,h

let g:python_host_prog='/usr/bin/python'

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

