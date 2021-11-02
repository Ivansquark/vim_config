syntax on
filetype plugin indent on
"=============================== BASIC SETTINGS ==============================
"=============================================================================
filetype plugin indent on
highlight SpellBad ctermfg=Black ctermbg=Red
hi StatusLine gui=reverse cterm=reverse
set autoread
set backup
set browsedir=current
set clipboard=unnamed
set encoding=utf-8
set hidden
set history=128
set mouse=a
set nocompatible
set noswapfile
set sessionoptions=curdir,buffers,tabpages
set t_Co=256
set termencoding=utf-8
set title
set undolevels=2048
":term to bottom
set splitbelow
set termwinsize=10x0 " 'termsize' didn't work - this did for me (GVIM 8.2)
"=============================================================================
"============================== EDITOR SETTINGS ==============================
"=============================================================================
autocmd CursorMoved * silent! exe printf("match Search /\\/", expand(''))
let c_syntax_for_h=""
let python_highlight_all = 1
set backspace=indent,eol,start
set laststatus=2
set linebreak


"set mps+=
set noruler
" показывать номера строк
set number
set scrolloff=4
set showcmd
set showmatch
" Подсвечивать строку с курсором
set cursorline
" ширина текста
set textwidth=120
" Подсвечивать 120 стобец
let &colorcolumn=&textwidth
highlight ColorColumn ctermbg=darkgray
" Раздражающая подсветка
"set visualbell
set wrap
" Не делать все окна одинакового размера
set noequalalways
" Высота окон по-умолчанию 20 строк
set winheight=20
" Подсвечивать синтаксис
syntax on
set ttimeoutlen=1 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки Где 1 - это мигающий прямоугольник 2 - обычный прямоугольник
let &t_SR.="\e[3 q" "SR = режим замены   3 - мигающее подчёркивание  4 - просто подчёркивание
let &t_EI.="\e[1 q" "EI = нормальный режим  5 - мигающая вертикальная черта  6 - просто вертикальная черта
"=============================================================================
"============================ INDENTATION SETTINGS ===========================
"=============================================================================
" автоматически расставлять отступы
set autoindent
" Заменять табуляцию на пробелы
set expandtab
set pastetoggle=
set shiftwidth=4
set smarttab
set smartindent
set softtabstop=4
" задать размер табуляции в два пробела
set tabstop=4
au FileType crontab,fstab set noexpandtab tabstop=8 shiftwidth=8
au FileType make set noexpandtab tabstop=4 shiftwidth=4
au FileType *.htm,*.html,*.css,*.js set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=120

"=============================================================================
"============================= TEXT SEARCH SETTINGS ==========================
"=============================================================================
" Игнорировать регистр при поиске
set ic
" Подсвечивать поиск
set hls
" Использовать инкреминтированный поиск
set is

" Включаем bash-подобное дополнение командной строки
set wildmode=longest:list,full
"=============================================================================
"================================= COLORSCHEME ===============================
"=============================================================================
set rtp+=~/.vim/bundle/vim-code-dark
colorscheme codedark
let g:airline_theme='codedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
"======================================================================
"==================== PLUGINS =========================================
"======================================================================
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'tomasiser/vim-code-dark'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"""""""""""""""""""""""""""""""""""""""
""""""""""""""" NERDTree """"""""""""""
"""""""""""""""""""""""""""""""""""""""
autocmd vimenter * NERDTree
:let g:NERDTreeWinSize=24
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeMapOpenInTab='\r'
" Configure Nerdtree
map <C-n> :NERDTreeToggle<CR>


