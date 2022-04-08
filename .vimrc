set nocompatible
filetype off

call plug#begin()

" File manager
Plug 'preservim/nerdtree'

" Git
Plug 'tpope/vim-fugitive'

" QoL
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'lukas-reineke/indent-blankline.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Visual
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Theme
Plug 'Luxed/ayu-vim'
Plug 'vim-airline/vim-airline-themes', { 'frozen': 1 } " Frozen b/c customized colors and stuff

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

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


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    let g:airline_symbols.colnr = ' ℅ '
    let g:airline_symbols.linenr = ' ¶ '
    let g:airline_symbols.maxlinenr = ' ☰ '
endif

let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_show_current_context_start_on_current_line = v:false
hi IndentBlanklineContextChar guifg=#A29BFE gui=nocombine

" Don't indent on `o` in markdown
let g:vim_markdown_new_list_item_indent = 0
" Don't conceal codeblocks in markdown
let g:vim_markdown_conceal_code_blocks = 0

set tabstop=4 shiftwidth=4 expandtab

set autoindent smartindent title showcmd showmatch autowrite number

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

set hlsearch ignorecase incsearch

if has('nvim')
    let g:rich_presence_binary = "target/release/nvimsence-rs"
    set rtp+=~/Projects/rust/nvimsence.rs
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup="Search", timeout=500}
endif

unlet python_highlight_space_errors

" function! CreatePreview()
"     sil! bd scratch
"     redir @"> | sil! echo system("mdcat -c", join(getline(1, '$'), "\n")) | redir END
"     bel 150vs
"     noswapfile hide enew
"     setlocal buftype=nofile bufhidden=hide
"     file scratch
"     1put!
" endfunction
" 
" command! Preview call CreatePreview()
