set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor= "block cursor
set nohlsearch
"set relativenumber
set number
set nohlsearch
set hidden
set noerrorbells
"set nowrap
"set ignorecase
"set smartcase
set noswapfile
set nobackup
"set undodir=~/.vim/undodir
"set undofile
set incsearch "highlight as you type
set termguicolors
set scrolloff=8 "scrolls start when you are at 8 line above bottom
set colorcolumn=80
set signcolumn=yes "set a column for linters
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %P
set linebreak
set cursorline
let mapleader='\'
"
""vim-polyglot
let g:polyglot_disabled = ['autoindent']
let g:polyglot_disabled = ['ftdetect']
"markdown conceal disabled
let g:vim_markdown_conceal = 0
let g:tex_conceal = ''
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0

"""""""""

"vim-plug
call plug#begin()
" Make sure you use single quotes
Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'css', 'less', 'json', 'markdown', 'yaml', 'html'] }
Plug 'dense-analysis/ale'
Plug 'luochen1990/rainbow'
"Plug 'ycm-core/YouCompleteMe'
call plug#end()

let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

"Remaps
vnoremap <C-c> "*y



"Surround shortcuts
"cs"' ysiw] ds" cst" changesurround"' deletesurround" ysInsideWordto] [hello]
"deletesurround" also in V mode to put the selected line inside something do
"S<p> will put all line inside <p> .... </p>
"wrap whole line in something do yss)
"
"NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"
"AutoPairs
let g:AutoPairsShortcutToggle = '<C-a>'
augroup autoPair
    au!
  au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->', '<':'>'}, ['{'])
augroup END
""""
"indentline plugins settings
let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"nvim indentation wrong toggle fixes it??
augroup indentToggle
  au!
  autocmd VimEnter * IndentLinesEnable
augroup END
"
""ale setting
let g:ale_linters = {
      \ 'html': ['vscode-html-language-server','prettier'],
      \ 'css': ['vscode-css-language-server','prettier'],
      \ 'json': ['vscode-json-language-server','prettier'],
      \ 'js': ['vscode-eslint-language-server','eslint'],
      \}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines','trim_whitespace'],
      \ 'c': ['clang-format'],
      \ 'cpp': ['clang-format'],
      \ 'tex': ['latexindent'],
      \ 'html': ['vscode-html-language-server','prettier'],
      \ 'css': ['vscode-css-language-server','prettier'],
      \ 'js': ['vscode-eslint-language-server','eslint'],
      \ 'json': ['vscode-json-language-server','prettier'],
      \}
let g:ale_enabled = 1
"let g:ale_fix_on_save = 1
"
"rainbow
let g:rainbow_active = 1

"vim-plug plugin manager
"nvim-telescope/telescope.nvim plugin
"gruvbox-community/gruvbox
"neovim lsp
"treesitter
"undotree
"fussed
"
"
"
"colorscheme gruvbox
"highlight Normal guibg=none

"remapping
"
"mode lhs-key rhs-todo
"
"let mapleader = "/\" "choose space for leader
"
"nnoremap //noramlmode norecursive remap
"nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search=
"vim.fn.input.........
"
"Autocommands
"
"fun! TrimWhitespace()
"   let l:save = winsaveview()
"   keeppatterns %s/\s\+$//e
"   call winrestview(l:save)
"endfun
"
"augroup THE_PRIMEAGEN "autogroup 
"   autocmd!
"   autocms BufWritePre * :call TrimWhitespace()
"augroup END
"
"
"splitting vimrc file
"
"break line like say set line into set.vim and put into plugin folder in .vim
"after that just make an install script to make sure evry file exits
"`
