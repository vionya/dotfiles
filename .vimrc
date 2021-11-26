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
Plugin 'Luxed/ayu-vim'
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
let NERDTreeShowHidden = 1

syntax on

let g:ayucolor = "mirage"
let g:ayu_italic_comment = 1
colorscheme ayu

let g:airline_theme = 'ayu_mirage'
let g:airline#extensions#tabline#enabled = 1

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

if has('nvim')
    let g:rich_presence_binary = "target/release/nvimsence-rs"
    set rtp+=~/Projects/rust/nvimsence.rs
    set rtp-=~/.vim/bundle/vimsence
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup="Search", timeout=500}
else
    let sem_version = matchstr(execute('version'), 'IMproved \zs[0-9\.]*\ze')
    let g:vimsence_small_text = "Vim " . sem_version
endif

unlet python_highlight_space_errors

function! CreatePreview()
    sil! bd scratch
    redir @"> | sil! echo system("mdcat -c", join(getline(1, '$'), "\n")) | redir END
    bel 150vs
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    file scratch
    1put!
endfunction

command! Preview call CreatePreview()
