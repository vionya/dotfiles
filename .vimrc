set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'hugolgst/vimsence'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'
Plugin 'ayu-theme/ayu-vim'

call vundle#end()
filetype plugin indent on

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

syntax on

let ayucolor="mirage"
colorscheme ayu

set number

set tabstop=4 shiftwidth=4 expandtab

set autoindent
set smartindent
set title
set showcmd
set showmatch
set autowrite

hi Folded guibg=NONE

set laststatus=2
set noshowmode

let g:airline_theme='ayu_mirage'
function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
endfunction
autocmd VimEnter * call AirlineInit()
let g:airline#extensions#tabline#enabled = 1

" Unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

set hlsearch
set ignorecase
