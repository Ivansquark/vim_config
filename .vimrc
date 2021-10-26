"" Last date: 26.10.2021 13:29
"
"
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
"if empty(glob('~/.vim/colors/sublimemonokai.vim'))
"silent !curl -fLo ~/.vim/colors/sublimemonokai.vim --create-dirs
"\ https://raw.githubusercontent.com/ErichDonGubler/vim-sublime-monokai/master/colors/sublimemonokai.vim
"endif
"set background=dark
"colorscheme sublimemonokai
colorscheme codedark
"set list
"set listchars=tab:>-,trail:-
highlight SpecialKey ctermfg=154 guifg=#ffffff
highlight NonText ctermfg=8 guifg=gray
"=============================================================================
"===================== AUTO-COMPLETION OF INPUT () ===========================
"=============================================================================

"=============================================================================
"====================== COLLAPSING TEXT BLOCKS (folding) =====================
"=============================================================================
set foldenable
"set foldmethod=syntax
set foldmethod=indent
set foldcolumn=1
set foldlevel=2
set foldopen=all
set tags=tags\ $VIMRUNTIME/systags
"=============================================================================
"========================== FILE MANAGEMENT SETTINGS =========================
"=============================================================================
set fileformat=unix
set fencs=utf-8,cp1251,koi8-r,cp866
autocmd! bufwritepre $MYVIMRC call setline(1, '"" Last date: '.strftime("%d.%m.%Y %H:%M"))
filetype on
filetype plugin on
filetype indent on
autocmd FileType perl call SetPerlConf()
set path=.,,**
"=============================================================================
"================================= PLUGINS ===================================
"=============================================================================
" Vundle required config
set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " let Vundle manage Vundle, required
" User defined plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
" " All of your Plugins must be added before the following line
call vundle#end()            " required

"=============================================================================
"=============================== PLUGIN SETTINGS =============================
"=============================================================================

"""""""""""""""""""""""""""""""""""""""
""""""""""""""" NERDTree """"""""""""""
"""""""""""""""""""""""""""""""""""""""
autocmd vimenter * NERDTree
:let g:NERDTreeWinSize=24
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeMapOpenInTab='\r'
" Configure Nerdtree
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""
"""""""""""""" Syntastic """"""""""""""
"""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""
"""""""""""" FixedTaskList """"""""""""
"""""""""""""""""""""""""""""""""""""""
" С/C++ файлы
autocmd filetype c,cpp set cin
 
" make-файлы
" В make-файлах нам не нужно заменять табуляцию пробелами
autocmd filetype make set noexpandtab
autocmd filetype make set nocin
 
" html-файлы
" Не расставлять отступы в стиле С в html файлах
autocmd filetype html set noexpandtab
autocmd filetype html set nocin
autocmd filetype html set textwidth=160
 
" css-файлы
" Не расставлять отступы в стиле C и не заменять табуляцию пробелами
autocmd filetype css set nocin
autocmd filetype css set noexpandtab
 
" python-файлы
" Не расставлять отступы в стиле С
autocmd filetype python set nocin
 
" Позволим конфигурационным файлам в проекте изменять настройки vim'a
set exrc
set secure
let g:ycm_use_clangd = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 0

let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"Clang-completer
" Включить дополнительные подсказки (аргументы функций, шаблонов и т.д.)
let g:clang_snippets=1
" Использоать ultisnips для дополнительных подскахок (чтобы подсказки шаблонов
" автогенерации были в выпадающих меню)
"let g:clang_snippets_engine = 'ultisnips'
" Периодически проверять проект на ошибки
let g:clang_periodic_quickfix=1
" Подсвечивать ошибки
let g:clang_hl_errors=1
" Автоматически закрывать окно подсказок после выбора подсказки
let g:clang_close_preview=1
" По нажатию Ctrl+F проверить поект на ошибки
map <C-F> :call g:ClangUpdateQuickFix()<CR>
 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
set splitright
 
" Snippets
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
