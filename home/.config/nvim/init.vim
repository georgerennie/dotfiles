call plug#begin('~/.vim/plugged')

" Language server client
Plug 'dense-analysis/ale'
let g:ale_linters = {
\   'systemverilog': ['verilator', 'hdl-checker'],
\   'python': ['flake8', 'mypy', 'pyright'],
\   'rust': ['analyzer', 'cargo', 'rustc', 'rls'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['clang-format'],
\   'c': ['clang-format']
\}
" \   'rust': ['rustfmt'],
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \   'html': ['prettier']

" let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
nmap <silent> <F2> <Plug>(ale_rename)

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
" Show tabs correctly in rust
let g:rust_recommended_style = 0

Plug 'kylelaker/riscv.vim'
Plug 'oraculo666/vim-m80'
Plug 'VelkyVenik/vim-avr'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dag/vim-fish'
Plug 'lervag/vimtex'
Plug 'pboettch/vim-cmake-syntax'
" Plug 'nachumk/systemverilog.vim'
autocmd BufNewFile,BufRead *.v :set filetype=systemverilog

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
" Tab completion
inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" use fd with fzf instead of find
let $FZF_DEFAULT_COMMAND = 'fd'
" map ; to search for file with fzf
map ; :Files<CR>

" Fancy status line
Plug 'itchyny/lightline.vim'

" Git diffs on the left
Plug 'airblade/vim-gitgutter'
" Always show gutter so it doesnt jump onto the screen when git gutter detects
" something
set signcolumn=yes

" Auto closing brackets
" Plug 'jiangmiao/auto-pairs'

" Detect indents
Plug 'ciaranm/detectindent'
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 0
let g:detectindent_preferred_indent = 4
" Use tabs displayed as 4 spaces by default
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab

" Commenting shortcut
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
let g:NERDAltDelims_c=1
let g:NERDCustomDelimiters = {
\'verilog': { 'left': '//' },
\'m80': { 'left': ';' },
\'fortran': { 'left': '*' },
\'python': { 'left': '#' }
\}

" Brackets colouriser
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" Show indents with little lines
Plug 'Yggdroot/indentLine'
let g:indentLine_setConceal = 0

" Colour scheme
Plug 'haishanh/night-owl.vim'

call plug#end()

" Use color scheme, this has to come after plug#end
syntax on
if (has("termguicolors"))
    set termguicolors
endif

colorscheme night-owl
highlight Comment guifg=#efabb1
highlight Normal guibg=#282a36
highlight LineNr guibg=#282a36 guifg=#6e7491
highlight CursorLineNr guifg=#fafbff guibg=#282a36
highlight SignColumn guibg=#282a36
highlight EndOfBuffer guibg=#282a36 guifg=#6e7491
let g:lightline = { 'colorscheme': 'nightowl' }

" Use ALE for autocomplete
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

" Use jk to exit insert mode
inoremap jk <Esc>

" use t for new tab
" nnoremap t :tabnew<CR>

" put a line at column 80
set colorcolumn=80

" wrap left and right keys at ends of lines
set whichwrap+=<,>,[,],h,l

" Show relative line numbers with the current line absolute
set number relativenumber

" Unset the last search pattern by hitting return
nnoremap <CR> :noh<CR><CR>

" Open new panes to the bottom/right
set splitbelow
set splitright

" Update swapfile/statusline/gitgutter every half a second, instead of every 4
set updatetime=500

set undofile " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir

" Show tabs
set list
set list lcs=trail:·,tab:»·

" Allow mouse usage
set mouse=a
