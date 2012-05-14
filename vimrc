" enable pathogen plugin manager
" call pathogen#infect()
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax on
set nocp
filetype plugin indent on

" Smart tabbing / autoindenting
set undolevels=100
set nocompatible
set autoindent
set smarttab

" Allow backspace to back over lines
set backspace=2
set exrc
set cino=t0
set autowrite
set noshowcmd

if exists('&selection')
    set selection=exclusive
endif

" get rid of stupid audible bell
set visualbell

" Give some room for errors
set cmdheight=2

" always show a status line
au VimEnter * set laststatus=2

" show ruler
set ruler

" Use a viminfo file
set viminfo='20,\"50

" set long history
set history=100

" Map Y do be analog of D
map Y y$

" Toggle paste 
map zp :set paste! paste?<CR>

" So I can get to ,
noremap g, ,
" Go to old line + column
noremap gf gf`"
noremap <C-^> <C-^>`"

" Switch off search pattern highlighting.
set nohlsearch

"Toggle search pattern highlighting and display the value
if v:version >=600
    map <f7> :nohlsearch<CR>
else
    map <f7> :set hlsearch! hlsearch?<CR>
endif
imap <f7> <C-O><f7> 

" Map control-cr to goto new line without comment leader
imap <C-CR> <ESC>o

" Look at syntax attribute
nmap <F5> :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
nmap <S-F5> :echo synIDattr(synID(line("."), col("."), 0), "name")<CR>

" delete the swap file
nmap \\. :echo strpart("Error Deleted",7*(0==delete(expand("%:p:h")."/.".expand("%:t").".swp")),7)<cr>

" Enable 'wild menus'
set wildmenu
set showfulltag
set display+=lastline
set printoptions=syntax:y,wrap:y
" end 'wild menus'

" set tab/indent and retab
set expandtab
set tabstop=4
set shiftwidth=4
" end tab/indent

" start syntax highlighting
syntax on
syntax enable
let g:solarized_termcolors=16
let g:solarized_termtrans=1
set background=dark
colorscheme solarized " use solarized
call togglebg#map("<F12>")
"end syntax highlighting

" start folding
function! JavaScriptFold() 
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

set foldmethod=syntax " fold by syntax
set foldlevel=1000 " disable folding by default
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf
" end folding

" start search config
set incsearch
" end search config

" start scroll config
set scrolloff=8
" end scroll config

" set pastemode
set pastetoggle=<F8>

" NERDTree 
map <F12> :NERDTreeToggle<CR>

" linewrapping
" set textwidth=120

" line numbers
set number

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" omni completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" refactoring and jump to def
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Ack searching
nmap <leader>a <Esc>:Ack!

" Makefile in parent directory
set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ ..

" buftab
:noremap <f2> :bprev<CR>
:noremap <f3> :bnext<CR>

py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dic(__file__=activate_this))
