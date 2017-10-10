set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'hdima/python-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'yssl/QFEnter'
Plugin 'jinja'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

syntax enable

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_args = '--max-line-length=150'

let g:SimpylFold_docstring_preview = 1

let g:qfenter_keymap = {}
let g:qfenter_keymap.open_keep = ['<CR>', '<2-LeftMouse>']
let g:qfenter_keymap.vopen = ['<Leader><CR>']
let g:qfenter_keymap.hopen = ['<Leader><Space>']
let g:qfenter_keymap.topen = ['<Leader><Tab>']


" Misc vim settings
set mouse=r
set expandtab
set smartindent
set tabstop=4
set number
set shiftwidth=4
set ai
set splitbelow
set splitright
set clipboard=unnamedplus

let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_keepdir = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_localrmdir='rm -r'

augroup syntax
    au!
    " markdown
    au FileType markdown setlocal shiftwidth=2 tabstop=2
    " ansible, yaml and jinja
    au FileType yaml setlocal shiftwidth=2 tabstop=2
    au BufNewFile,BufRead *.j2 set filetype=jinja
    au BufNewFile,BufRead *.tpl set filetype=jinja
    au BufNewFile,BufRead *.json.j2 setlocal shiftwidth=2 tabstop=2
    au BufNewFile,BufRead *.json setlocal shiftwidth=2 tabstop=2
    au BufNewFile,BufRead *.yml.j2 setlocal shiftwidth=2 tabstop=2
    " python
    au FileType python setlocal foldlevelstart=1
    " No bells
    au GUIEnter * set visualbell t_vb=
augroup END
