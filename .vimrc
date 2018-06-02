set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine'

Plugin 'pangloss/vim-javascript' 
Plugin 'lervag/vimtex'

Plugin 'scrooloose/nerdtree'

Plugin 'prettier/vim-prettier'

Plugin 'vim-syntastic/syntastic'

Plugin 'tihomirov/vim-glsl'

Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

set backspace=indent,eol,start
set conceallevel=2
set cursorline
set lazyredraw
set noshowmode
set showcmd

set langmenu=en_US
let $LANG = 'en_US'


source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set winaltkeys=no

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nocompatible
set autoindent
set smartindent


set tabstop=2        " tab width is 4 spaces
set shiftwidth=2     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

set textwidth=120

syntax enable
set background=dark
set t_Co=256
"colorscheme darkblue

let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized 

set number
set relativenumber

noremap S :call SwitchSourceHeader()<CR>

set comments=sl:/*,mb:\ *,elx:\ */

map <C-h> :tabp<CR>
map <C-l> :tabn<CR>
map <C-k> :m .-2<CR>==
map <C-j> :m .+1<CR>==
map <F12> :!make<CR>
noremap <S-tab> gg=G''
noremap <C-G> :YcmCompleter GoTo<CR>
set wrap
set linebreak

map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>
noremap Ö :
noremap h <left>
noremap j g<down>
noremap k g<up>
noremap l <right>

let g:indentLine_char = '|'

function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "cpp" || expand("%:e") == "cc")
    tab drop %:t:r.h
  else
    if filereadable(join([expand("%<"),".cc"],""))
        tab drop %:t:r.cc
    elseif filereadable(expand(join(["%<",".cpp"],"")))
        tab drop %:t:r.cpp
    endif
  endif
endfunction

"nmap s :call SwitchSourceHeader()<CR>

set showcmd
set wildmenu

:command! Vimrc :tabe ~/.vimrc

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set undodir=~/.vim/undo//


let g:ycm_global_ycm_extra_conf = '~/.vim/plugin/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:javascript_plugin_jsdoc = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_javascript_eslint_args = ['--fix']
let g:syntastic_mode_map = { 'mode': 'passive'}
let g:vim_json_syntax_conceal = 0
