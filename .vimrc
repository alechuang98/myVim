
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


Plugin 'octol/vim-cpp-enhanced-highlight'

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

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_theme= 'molokai'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = ' :'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0


set nu
set ai
set tabstop=4
set shiftwidth=4

set mouse=a
set backspace=2
set autochdir
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

inoremap <C-s> <Esc> :w <CR>
map <C-a> <esc>ggVG<CR>
map <F2> <Esc>:bn<CR>

syntax enable
colorscheme monokai

set makeprg=g++\ -Wall\ -Wshadow\ -std=c++11\ %\ -o\ %:r
autocmd filetype cpp map <F9> :w <bar> make <CR> <CR>:let g:is_open = 0<CR> : call ToggleQuickFix()<CR>
autocmd filetype cpp map <F9> :w <bar> make <CR> <CR>:let g:is_open = 0 <CR> :call ToggleQuickFix()<CR>
map <F3> :./%<
map <F8> :!gnome-terminal --tab -e "/bin/bash -c './%<;  echo;  echo Press ENTER to continue; read line;exit; exec /bin/bash -i'"<CR> <CR>
"<CR> gnome-terminal <CR> ./%< <CR>  <CR>:cd %:p:h<CR> 


"Toggle QuickFix Windows
let g:is_open = 0
function! ToggleQuickFix()
  if g:is_open == 1
    cclose
    let g:is_open = 0
  else
    vert copen
    vert resize 40
    wincmd h
    let g:is_open = 1
  endif
endfunction
nmap <script> <silent> <F10> :call ToggleQuickFix()<CR>
