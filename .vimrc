""" Plug
set nocompatible
filetype off

call plug#begin('~/.vim/bundle')

""" Fix Konsole font changes...
set guicursor=

""" Plug plugins
Plug 'vim-airline/vim-airline'
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

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*.pyo
set wildignore+=*.o
set wildignore+=*.elf
set wildignore+=*.hex
set wildignore+=*/_build/*
set wildignore+=*/node_modules/*

Plug 'vim-scripts/wombat256.vim'

if has('python') || has('python3')
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"
    let g:UltiSnipsEditSplit="vertical"
endif

" Plug 'neomake/neomake'
Plug 'w0rp/ale'

let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
"let g:ale_linters = {
"\   'python': ['pylint'],
"\}
let g:ale_open_list = 0
let g:ale_lint_delay = 1000

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

let g:gitgutter_sign_column_always = 1


" Plug 'ciaranm/detectindent'
" Plug 'scrooloose/syntastic'

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


"Plug 'scrooloose/syntastic'
"nmap <F7> :SyntasticCheck<CR>
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
" let g:syntastic_enable_signs = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'tpope/vim-unimpaired'
Plug 'gregsexton/MatchTag'
" Plug 'Valloric/YouCompleteMe'
Plug 'elixir-lang/vim-elixir'
Plug 'mitsuhiko/vim-jinja'
Plug 'dougireton/vim-chef'
Plug 'pearofducks/ansible-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go'
let g:go_version_warning = 0
Plug 'LnL7/vim-nix'
"Plug 'python-rope/ropevim'
Plug 'python-mode/python-mode', { 'for': ['python'], 'branch': 'develop' }
let g:pymode_folding = 0
let g:pymode_python = "python"
let g:pymode_rope = 1
let g:pymode_lint_async = 1

let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_rope_show_doc_bind = '<leader>pd'
let g:pymode_rope_goto_definition_bind = '<leader>pg'
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_rope_rename_bind = '<leader>pr'
let g:pymode_rope_module_to_package_bind = '<leader>p1p'
let g:pymode_rope_extract_method_bind = '<leader>pm'
let g:pymode_rope_extract_variable_bind = '<leader>pl'
let g:pymode_rope_use_function_bind = '<leader>pu'
let g:pymode_rope_move_bind = '<leader>pv'
let g:pymode_rope_change_signature_bind = '<leader>ps'

" Plug 'editorconfig/editorconfig-vim'
" let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:ConqueGdb_GdbExe = '/usr/local/gcc-arm-none-eabi-4_9-2015q3/bin/arm-none-eabi-gdb'
"Plug 'vim-scripts/Conque-GDB'
Plug 'posva/vim-vue'

let g:NERDDefaultAlign = 'left'

call plug#end()

""" Coding style
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set smarttab
set expandtab

filetype plugin indent on

" Per-language/project indentation
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby.chef setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vue setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

augroup vagrant
	au!
	au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END
"augroup ProjectSetup
"au BufRead,BufEnter /home/informatic/nrf/projects/* set noexpandtab tabstop=4 shiftwidth=4
"augroup END


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
au BufWritePost * execute 'pclose'

" au BufReadPost * :DetectIndent

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

set clipboard=unnamedplus
set guicursor=
