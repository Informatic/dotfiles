" My .vimrc file, based on mbrochh's vim-as-a-python-ide available on
" https://github.com/mbrochh/vim-as-a-python-ide/blob/master/.vimrc
" ~ inf


" .vimrc autoreloading
autocmd! bufwritepost .vimrc source %

" Clipboard support
set clipboard=unnamed

" F2 will toggle the "paste mode" (disabled indentation)
set pastetoggle=<F2>

" Mouse support
set mouse=a

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" some of the shortcuts i'm used to
map <C-t> <esc>:tabnew<CR>
" map <C-n> <esc>:tabnew<CR>
" map <C-w> <esc>:q<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

map <Leader>1 1gt
map <Leader>2 2gt
map <Leader>3 3gt
map <Leader>4 4gt
map <Leader>5 5gt
map <Leader>6 6gt
map <Leader>7 7gt
map <Leader>8 8gt
map <Leader>9 9gt
map <Leader>0 10gt

" Eyecandy
" colorscheme peachpuff
set t_Co=256
color wombat256mod

" Indentation
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Syntax highlighting and automatic indentation
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Random stuff
set history=700
set undolevels=700

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" ===========================================================================
" Custom plugins 
" ===========================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_indent = 0
let g:pymode_lint = 0
let g:pymode_lint_ignore = "W191,E128,E121"  " Allow tab indenatation
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


" Coding style
" set smartindent
" set expandtab
set tabstop=4
" setlocal softtabstop=4
set shiftwidth=4
" setlocal shiftround
" setlocal autoindent

map <F5> <ESC>:w<CR>:! make<CR>

set cursorline
