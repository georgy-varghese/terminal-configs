" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes


" Plugins
Plug 'tpope/vim-fugitive'
Plug 'hdima/python-syntax'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tmhedberg/SimpylFold'
Plug 'yssl/QFEnter'
Plug 'jpalardy/vim-slime'
Plug 'jamessan/vim-gnupg'
Plug 'chriskempson/base16-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pearofducks/ansible-vim'
Plug 'lepture/vim-jinja'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hashivim/vim-terraform'
Plug 'jreybert/vimagit'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'miyakogi/conoline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'

" Misc Plugins
"Plug 'christoomey/vim-tmux-navigator'


" All of your Plugins must be added before the following line
" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

"oldstuff - 2lines
"set nocompatible              " be iMproved, required
"filetype off                  " required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"neovim ALE
let g:ale_lint_on_insert_leave = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_signs = 0

" Vim slime
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-space>
let g:slime_target = "tmux"

" VIM move to search pattern as you type
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>

" Syntastic recommended settings
syntax enable
set statusline+=%#warningmsg#
set statusline+=%*

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Conoline (for cursorline colors)
let g:conoline_auto_enable = 1
"let g:conoline_use_colorscheme_default_normal=1
" let g:conoline_use_colorscheme_default_insert=1

"Yggdroot Indentline
"let g:indentLine_setColors = 0
"['|', '¦', '┆', '┊']
let g:indentLine_char =  '┊'

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
"netrw doesnt gets closed due to hidden buffers from deleted files
autocmd FileType netrw setl bufhidden=delete
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
" hi cursorline cterm=none ctermbg=darkgray ctermfg=White
"endfunction
" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-tomorrow
"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background
"endif
"colorscheme base16-default-dark
"hi Normal ctermbg=none
"hi NonText ctermbg=none

" Vim gpg editing
let g:GPGFilePattern = '*.\(gpg\|gpgenc\|asc\|pgp\)'
let g:GPGPreferArmor = 1

"" Powerline
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim
"set laststatus=2
"set showtabline=2
"set noshowmode

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
" set t_Co=256
"let g:airline_solarized_bg='dark'

" vim-terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=0
let g:terraform_fmt_on_save=1

""""""""""
" vim-go
""""""""""
" Configure indentation
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Code highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

" Auto import dependencies
let g:go_fmt_command = "goimports"

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

""""""""""
" Misc vim settings
" set background=dark
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

" ####
" lsxyz settings
"set bg=light
set go=a
set hlsearch

" Some basics:
    set nocompatible
	set encoding=utf-8

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" ####

" indentLine Plugin
"let g:indentLine_setColors = 0
"oldstuff - 1lines
"let g:indentLine_color_term = 150
"let g:indentLine_leadingSpaceEnabled = 1

" Clear search highlighting by pressing enter
nnoremap <CR> :noh<CR><CR>:<backspace>

" markdown fold
" set cursorline

" ansible-vim
let g:ansible_unindent_after_newline = 1
let g:ansible_extra_syntaxes = "jinja.vim"
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_with_keywords_highlight = 'Constant'

augroup syntax
    au!
    " markdown
    au FileType markdown setlocal shiftwidth=2 tabstop=2
    au! BufRead,BufNewFile *.txt       set filetype=markdown
    " ansible, yaml and jinja
    "au BufRead,BufNewFile *.yml set filetype=ansible
    au FileType yaml setlocal shiftwidth=2 tabstop=2
"    au BufNewFile,BufRead *.j2 set filetype=jinja
"    au BufNewFile,BufRead *.yml.j2 set filetype=jinja
"    au BufNewFile,BufRead *.tpl set filetype=jinja
    au BufNewFile,BufRead *.json.j2 setlocal shiftwidth=2 tabstop=2
    au BufNewFile,BufRead *.json setlocal shiftwidth=2 tabstop=2
    au BufNewFile,BufRead *.yml.j2 setlocal shiftwidth=2 tabstop=2
    " python
    au FileType python setlocal foldlevelstart=1
    " No bells
    au GUIEnter * set visualbell t_vb=
augroup END

"fuzzyfinder
set rtp+=~/.fzf

" Neovim terminal
" To map <Esc> to exit terminal-mode: >
    tnoremap <Esc> <C-\><C-n>

" To simulate |i_CTRL-R| in terminal-mode: >
    tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
    inoremap <A-h> <C-\><C-N><C-w>h
    inoremap <A-j> <C-\><C-N><C-w>j
    inoremap <A-k> <C-\><C-N><C-w>k
    inoremap <A-l> <C-\><C-N><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
