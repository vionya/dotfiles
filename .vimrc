set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vimsence/vimsence'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'
Plugin 'ayu-theme/ayu-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-surround'

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

set tabstop=4 shiftwidth=4 expandtab

set autoindent
set smartindent
set title
set showcmd
set showmatch
set autowrite
set number

hi Folded guibg=NONE

set laststatus=2
set noshowmode

let g:airline_theme='ayu_mirage'
let g:airline#extensions#tabline#enabled = 1

" Remap <C-{arrow key}> to move around tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

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
set incsearch

" Fix issues with vim being weird with
" background colour in kitty
let &t_ut=''

if has('nvim')
    set rtp+=~/Projects/rust/nvimsence.rs
    set rtp-=~/.vim/bundle/vimsence
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup="Search", timeout=500}

    let g:nvimsence_state = "xyz"
else
    let sem_version = matchstr(execute('version'), 'IMproved \zs[0-9\.]*\ze')
    let g:vimsence_small_text = "Vim " . sem_version
endif

command Indent normal gg=G
