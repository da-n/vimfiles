" Load Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" We don't need Vi compatibility
set nocompatible

" We don't need modelines
set modelines=0

" Change the <leader> to ,
let mapleader = ","

" Color scheme
" set t_Co=256
syntax enable
" set background=dark
" let g:solarized_termcolors=256
call togglebg#map("<F5>")

colorscheme noctu
" colorscheme solarized
" let g:rehash256=1
" let g:molokai_original=1

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" General settings
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set cindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile
set ttimeoutlen=50

" Wrap at 80 chars
" set wrap
" set textwidth=79
" set formatoptions=qrn1
" set colorcolumn=85

" backup to ~/.vim-tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" VimSession
:let g:session_autosave = 'no'
:let g:session_directory = '~/.vim-sessions'

" NERDTree
" Map Ctrl+n to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
" See also http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" Powerline
let g:airline_powerline_fonts=1
let g:Powerline_symbols = "fancy"
let g:airline#extensions#tabline#enabled = 1

" Strip trailing whitespace
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" tab navigation like firefox
nnoremap <C-S-h>       :tabprevious<CR>
nnoremap <C-S-l>       :tabnext<CR>
nnoremap <C-t>       :tabnew<CR>
inoremap <C-S-h>  <Esc>:tabprevious<CR>i
inoremap <C-S-l>  <Esc>:tabnext<CR>i
inoremap <C-t>  <Esc>:tabnew<CR>
