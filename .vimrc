" One .vimrc File To Rule Them All.
"
" Version: 1.0.0
" Last Updated: 10-10-2012 04:13 AM GMT+3
" Author: Usman Bashir
" Maintainer: http://usmanbashir.com
" License: http://opensource.org/licenses/bsd-license.php



" @General

" Disable VI compatibility mode.
set nocompatible

set t_Co=256

" Runtime Path Manipulation to enable Pathogen.
call pathogen#infect()



" @Theme

if has('gui_running')
	" Desert is a nice color scheme but I should really explore my options.
	colorscheme desert

	" Override the columns and lines in the .gvimrc file if need be for each different computer based on its screen resolution.
	set columns=170 lines=60

	set guioptions=ac
else
	" Need to pick a decent color scheme for the Terminal that works across most of them.
	colorscheme default
endif



" @Visual Cues

" Switch syntax highlighting on.
syntax on

" Show relative line numbers if the current VIM version supports them.
" Otherwise default back to regular numbered lines.
if v:version >= 703
	set relativenumber
else
	set number
endif

" Highlight matching bracket.
set showmatch

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" Use incremental search (find as you type).
set incsearch

" Make searches case-insensitive, unless they contain upper-case letters.
set ignorecase smartcase

" Show the line and column number of the cursor position and the %progress through file.
set ruler

" Show the current command in the lower right corner.
set showcmd

" Show the current mode.
set showmode

" Keep at least 3 line around the cursor.
set scrolloff=3

" Always show a status line.
set laststatus=2

" Use visual bell instead of beeping.
set visualbell



" @Text Formatting

" No tabs, just spaces!
set autoindent shiftwidth=4 softtabstop=4

" Expand <Tab> with space.
set expandtab

" Just so that files with tabs can be displayed properly.
set tabstop=8

" Use existing indents for new indents.
set copyindent



" @Mappings

" Change the map leader from \ to ,
let mapleader = ","

" Make ; do the same thing as :
" It's one less key to hit every time I want to execute a command.
nnoremap ; :

" The Zen Masters gateway in to the Zen Write Room.
"
" Need to change this from a simple mapping in to a function that
" can toggle between the Zen Write Room and just plan vim and use 
" the <F1> key to do so.
if has('gui_running')
    map <leader>f :set columns=999 guioptions=-R lines=999 fullscreen!<cr>
endif

" Toggle current line highlighting.
map <leader>l :set cursorline!<cr>

" Remap jj to escape insert mode as its unlikely I will ever need to type jj and its much faster then hitting the <Esc> key.
inoremap jj <Esc>

" Toggle the NERD Tree.
nmap <leader>n :NERDTreeToggle<cr>

" Reselect the text that was just pasted so I can perform commands like indentation on it.
nnoremap <leader>v V`]

" Disable arrow keys while in normal and insert modes to force myself to keep using hjkl.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Make j and k work the way one expects instead of working in some archaic 'movement by file line instead of screen line' fashion.
nnoremap j gj
nnoremap k gk

" Fold Tag
nnoremap <leader>ft Vatzf


" @Misc

if v:version >= 700 && has('gui_running')
	" Turn on spell checking for the English language.
	set spl=en
	set spell
endif

set fileformats=unix

set encoding=utf-8

" Auto Completion.
set wildmenu
set wildmode=longest:full

set history=1024

" Don't show the welcome message when starting.
set shortmess=I

set backupdir=~/.vim/tmp,/var/tmp,.
set directory=~/.vim/tmp,/var/tmp,.

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
