" One .vimrc File To Rule Them All.
"
" Author: Usman Bashir
" Maintainer: http://usmanbashir.com
" License: http://opensource.org/licenses/bsd-license.php



" @General

" Disable VI compatibility mode.
set nocompatible

set t_Co=256

" Use the stronger BlowFish encryption by default.
set cryptmethod=blowfish

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start


" @Plugin Manager

" Runtime Path Manipulation to enable Plug.
set runtimepath=~/dotvimfiles/.vim,$VIMRUNTIME

call plug#begin('~/dotvimfiles/.vim/plugged')

Plug 'tomasr/molokai'
Plug 'heartsentwined/vim-emblem'
"Plug 'mmai/wikilink'
"Plug 'jceb/vim-orgmode'
"Plug 'mattn/calendar-vim'
Plug 'majutsushi/tagbar'
Plug 'chrisbra/NrrwRgn'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-rake'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 't9md/vim-ruby-xmpfilter'
"Plug 'mustache/vim-mustache-handlebars'
" Plug 'wincent/Command-T', {'do': 'cd ruby/command-t && ruby extconf.rb && make'}
"Plug 'JoshCheek/rcodetools'
"Plug 'mtth/scratch.vim'
Plug 'vim-scripts/SyntaxRange'
"Plug 'vim-scripts/utl.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'roblillack/vim-bufferlist'
"Plug 'Shougo/neocomplcache.vim' | Plug 'Shougo/unite.vim' | Plug 'Shougo/vimproc.vim', {'do': 'make'} | Plug 'Shougo/vimshell.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
"Plug 'benmills/vimux'
"Plug 'altercation/vim-colors-solarized'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()



" @Theme

if has('gui_running')
    colorscheme molokai

    " Override the columns and lines in the .gvimrc file if need be for each system based on there screen resolution.
    set columns=170 lines=60

    set guioptions=ac
else
    colorscheme molokai
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

" Hide the mouse cursor when typing.
set mousehide

" Highlight debugger statements.
"
" Ruby on Rails Logger:
au BufEnter *.rb syn match error contained "\<logger\>"

" Force syntax coloring for HamlC files.
au BufNewFile,BufRead *.hamlc set filetype=haml


" @Text Formatting

" No tabs, just spaces!
set autoindent shiftwidth=2 softtabstop=2

" Expand <Tab> with space.
set expandtab

" Just so that files with tabs can be displayed properly.
set tabstop=4

" Use existing indents for new indents.
set copyindent

" Set maximum line width for all documents.
set textwidth=90
set formatoptions=tcaw


" @Mappings

" Change the map leader from \ to ,
let mapleader = ","
let maplocalleader = '\'

" Make ; do the same thing as :
" It's one less key to hit every time I want to execute a command.
nnoremap ; :

" Clear search highlighting.
map <leader>h :noh<cr>

" The Zen Masters gateway in to the Zen Write Room.
"
" Need to change this from a simple mapping in to a function that
" can toggle between the Zen Write Room and just plan vim and use
" the <F1> key to do so.
if has('gui_running')
    map <leader>f :set columns=999 guioptions=-R lines=999 fullscreen!<cr>
endif

" Toggle current line highlighting and enable it by default.
set cursorline
map <leader>ll :set cursorline!<cr>

" Toggle line numbers.
if v:version >= 703
  map <leader>ln :set relativenumber!<cr>
else
  map <leader>ln :set number!<cr>
endif

" Remap jj to escape insert mode as its unlikely I will ever need to type jj and its much faster then hitting the <Esc> key.
inoremap jj <Esc>

" Toggle the NERD Tree.
nmap <leader>n :NERDTreeToggle<cr>

" CommandT Mappings
"
" Go to lines and tags.
map <leader>gl :CommandTFlush<cr>\|:CommandTLine<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>

" Fuzzy find files.
" map <leader>f :CommandTFlush<cr>\|:CommandT<cr>

" Find a buffer.
map <leader>b :CommandTFlush<cr>\|:CommandTBuffer<cr>

" For Vim only use.
map <leader>vc :CommandTFlush<cr>\|:CommandTCommand<cr>
map <leader>vh :CommandTFlush<cr>\|:CommandTHelp<cr>
map <leader>vhh :CommandTFlush<cr>\|:CommandTHistory<cr>

" Open the current Git Diff in a Tab.
command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>d :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>

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

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Fold Tag
nnoremap <leader>ft Vatzf

" Search for highlighted text with * and #
vmap * y/<c-r>"<cr>
vmap # y?<c-r>"<cr>

" Open the scratch buffer.
map <leader>c :Scratch<cr>

" Virtual keymap for executing xmpfilter against current Ruby only buffer.
autocmd FileType ruby nmap <buffer> <leader>r <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <leader>r <Plug>(xmpfilter-run)

" Insert/delete annotation marks for xmpfilter against current Ruby only buffer.
autocmd FileType ruby nmap <buffer> <leader>m <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <leader>m <Plug>(xmpfilter-mark)

" Code completion by xmpfilter for the current Ruby buffer.
if has("gui_running")
    autocmd FileType ruby inoremap <C-Space> <C-x><C-u>
else
    " Some Terminals don't interpret <C-Space> correctly and Vim understands
    " it as <C-@> which is a built-in mapping (:help CTRL-@).
    "
    " This overrides the unexpected behavior for non GUI Vim's.
    autocmd FileType ruby inoremap <C-@> <C-x><C-u>
endif

" Toggle the CTag List plugin.
nmap <leader>t :TlistToggle<cr>
nmap <F8> :TagbarToggle<cr>

" EasyMotion config and bindings.
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Indent if we're at the beginning of a line. Otherwise, do code completion.
"function! InsertTabWrapper()
"  let col = col('.') - 1
"  if !col || getline('.')[col - 1] !~ '\k'
"    return "\<tab>"
"  else
"    return "\<c-p>"
"  endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>

" Allow pasting code without trying to format it in any way.
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>


" @Auto Commands

" Jump to last cursor position unless it's invalid or in an event handler.
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Force Vim to register *.md files as Markdown files.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


" @Plugins

" RcodeTools
"
" Specify the RI executable to use.
let g:RCT_ri_cmd = "ri --no-pager -f ansi "


" EasyTags
"
" Run Exuberant Ctags in the background.
let g:easytags_async = 1


" BufferList
map <silent> <F3> :call BufferList()<CR>


" Powerline

let g:airline_theme = 'cool'
let g:airline_inactive_collapse = 0
let g:airline_powerline_fonts = 1

" Make sure the GUI is also using th patched Powerline font.
if has('gui_running')
  set guifont=Monaco\ for\ Powerline:h14
endif


" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" GitGutter

" Reduce the default Vim update time down from 4 seconds to 250ms.
set updatetime=250

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" Vimux

" Run the current Ruby file through Docker
map <Leader>rd :call VimuxRunCommand("eval $(docker-machine env) && docker-compose exec web ruby " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

let g:VimuxOrientation = "h"
let g:VimuxHeight = "50"
let VimuxResetSequence = "C-l"


" @Misc

" Toggle spell checking.
if v:version >= 700
  set spelllang=en_us
  hi SpellBad cterm=underline
  nmap <silent> <leader>s :set spell!<CR>
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



" CoC Config
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
"set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}



" indentLine Config
" let g:indentLine_char_list = ['▏', '|', '⎸', '¦', '┆', '┊']
let g:indentLine_char_list = ['▏']


" ALE Config
let g:airline#extensions#ale#enabled = 1



" CtrlP Config
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlPMixed'

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
