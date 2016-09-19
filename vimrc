set t_Co=256
" vim-plug settings
call plug#begin('~/.vim/plugged')

" General plugins
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'

" Autocompleters
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Source control
Plug 'tpope/vim-fugitive'

" Syntax

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'ianks/vim-tsx'

" coffeescript
Plug 'kchmck/vim-coffee-script'

" colorschemes
Plug 'Lokaltog/vim-distinguished'

call plug#end()

" undo magic
if !isdirectory("/tmp/undo-dir")
    call mkdir("/tmp/undo-dir", "", 0700)
endif
set undodir=/tmp/undo-dir
set undofile

" backspace magic
set backspace=indent,eol,start
" mouse magic
set mouse=a

" ctrlp settings
let g:ctrlp_max_files=0
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

" NERDTree shortcut
map <C-e> :NERDTreeToggle %<CR>

" airline settings
let g:airline#extensions#tabline#enabled = 1

" YCM settings
let g:ycm_rust_src_path = '/home/robert/rust-src/rustc-1.11.0/src'
map <C-b> :YcmCompleter GoToDefinition<CR>

" colorscheme
colorscheme distinguished
set background=dark

" syntax highlighting
syntax on
filetype plugin indent on

" line numbers
set number

" tab expansion
" default shiftwidth
set shiftwidth=4
set tabstop=4
set expandtab

"let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd ctermbg=grey
autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=darkgrey

" js/coffee/ts/ts do 2 spaces instead
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
autocmd FileType coffee setlocal tabstop=2 shiftwidth=2
