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
Plugin 'powerline/powerline'
Plugin 'jinja'
Plugin 'jpalardy/vim-slime'
Plugin 'jamessan/vim-gnupg'  
Plugin 'chriskempson/base16-vim'
Plugin 'dhruvasagar/vim-table-mode'

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

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-space>
let g:slime_target = "tmux"

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
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_keepdir = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_localrmdir='rm -r'
" vim table mode setting
let g:table_mode_corner='|'
" for ReST-compatible table use
" let g:table_mode_corner_corner='+'
" let g:table_mode_header_fillchar='='

"function! Whitespace()
"    if !exists('b:ws')
"        highlight Conceal ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
"        highlight link Whitespace Conceal
"        let b:ws = 1
"    endif
"    syntax clear Whitespace
"    syntax match Whitespace / / containedin=ALL conceal cchar=·
"    setlocal conceallevel=2 concealcursor=c
"endfunction

function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"function! s:SetCursorLine()
"    hi cursorline cterm=none ctermbg=00
"    hi cursorline cterm=none ctermbg=darkgray ctermfg=White
"endfunction
" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-tomorrow
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
colorscheme base16-default-dark
hi Normal ctermbg=none
hi NonText ctermbg=none

" Vim gpg editing
let g:GPGFilePattern = '*.\(gpg\|gpgenc\|asc\|pgp\)'
let g:GPGPreferArmor = 1

" Powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim
set laststatus=2
set showtabline=2
set noshowmode

" Misc vim settings
"set background=dark
set mouse=r
set expandtab
set smartindent
set tabstop=4
set number
set foldlevelstart=0
set foldmethod=indent
set shiftwidth=4
set ai
set splitbelow
set splitright
set clipboard=unnamedplus
set pastetoggle=<C-F>

" markdown fold
set cursorline

augroup syntax
    au!
    " markdown
    au FileType markdown setlocal shiftwidth=2 tabstop=2
    au! BufRead,BufNewFile *.txt       set filetype=markdown
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
