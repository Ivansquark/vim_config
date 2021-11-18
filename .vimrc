syntax on
"=============================== BASIC SETTINGS ==============================
"=============================================================================
filetype plugin indent on
highlight SpellBad ctermfg=Black ctermbg=Red
hi StatusLine gui=reverse cterm=reverse
set autoread
"set backup
set browsedir=current
set clipboard=unnamed
set encoding=utf-8
set hidden
set history=128
set mouse=a
set nocompatible
set noswapfile
set sessionoptions=curdir,buffers,tabpages
"set t_Co=256
set termencoding=utf-8
set title
set undolevels=2048
"устанавливаем всплывающее окно снизу (терминал)
set splitbelow
set termwinsize=10x0
:"packadd termdebug
"=============================================================================
"========================== NAVIGATION SETTINGS ==============================
"=============================================================================
"togle between header and source
nnoremap <F3> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
"":term to bottom
set splitbelow
set termwinsize=10x0 " 'termsize' didn't work - this did for me (GVIM 8.2)
set splitright
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Ctrl-Left or Ctrl-Right to go to the previous or next tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Alt-Left or Alt-Right to move the current tab to the left or right
nnoremap <silent> <C-Down> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-Up> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" buffers:::::: bn, bp, bd-delete, bw - realy delete
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

set paste
" Заменять табуляцию на пробелы
set expandtab
set pastetoggle=
set shiftwidth=4
set smarttab
set smartindent
set softtabstop=4
" задать размер табуляции в четыре пробела
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
let g:airline_theme = 'codedark'
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
"Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-airline/vim-airline'
Plugin 'neoclide/coc.nvim'
Plugin 'vim-syntastic/syntastic'
Plugin 'rhysd/vim-clang-format'
Plugin 'jackguo380/vim-lsp-cxx-highlight'
"Plugin 'puremourning/vimspector'
" " All of your Plugins must be added before the following line
call vundle#end()            " required

"============================================================================
"============================ PLUGINS SETTINGS ==============================
"============================================================================
:filetype on 
set runtimepath+=~/.vim/bundle/YouCompleteMe/
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tag_files = 1
set completeopt=longest,menu
"------------------ NERDTree --------------------
"autocmd vimenter * NERDTree
:let g:NERDTreeWinSize=20
"let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeMapOpenInTab='\r'
let NERDTreeShowHidden=1
" Configure Nerdtree
map <C-n> :NERDTreeToggle<CR>
"---------------    AIRLINE     -----------------
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = ' '
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"---------------    syntastic    -----------------
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"---------------    syntax highlighting ----------
" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"------     Auto-Formatting     ------------------
".clang-format config-file in the root of your project.
"-----------     COC     -------------------------
" key mappings example
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <Leader>f :<C-u>ClangFormat<CR>
"-----------    VimSpector      ------------------
"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
"packadd! vimspector
