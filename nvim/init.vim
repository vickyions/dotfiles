set autoindent "autoindent

set smartindent

set autoread
set backspace=indent,eol,start
set nobackup

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set foldmethod=manual
set foldnestmax=2
set nofoldenable
set foldlevel=2

syntax on
set number
"set relativenumber

set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %P

set swapfile
set directory=$HOME/.vim/swp//

set backup
set backupdir=$HOME/.vim/.backup//

set history=1000
set showcmd

set showmode

set ruler
set cursorline
"set cursorcolumn
"au Colorscheme * hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

set title

set linebreak
"set spell

set mouse=
set scrolloff=8
set colorcolumn=80

set termguicolors

filetype off

"vim-polyglot
let g:polyglot_disabled = ['autoindent']
let g:polyglot_disabled = ['ftdetect']

"https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'rrethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'css', 'less', 'json', 'markdown', 'yaml', 'html'] }
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

"indentline
"let g:indentLine_setColors = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"raindbow brackets
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"gruvbox treesitter sainnhe/gruvbox
" For dark version.
        set background=dark
        " For light version.
"        set background=light
        " Set contrast.
        " This configuration option should be placed before `colorscheme gruvbox-material`.
        " Available values: 'hard', 'medium'(default), 'soft'
        let g:gruvbox_material_background = "soft"
        " For better performance
        let g:gruvbox_material_better_performance = 1
        colorscheme gruvbox-material

"cursor shape only the insert mode is changed to block others are default
set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor2


"vim coc config
"""""""""""""""""""""
"Use <cr> to confirm completion
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"" use <tab> for trigger completion and navigate to the next complete item
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"inoremap <silent><expr> <Tab>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"
"from example config on github coc.nvim
"set nobackup
set updatetime=300
set signcolumn=yes
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

"Prettier coc-Prettier
"nmap <leader>p :CocCommand prettier.formatFile<CR>

"""""""""""""""""""""

"""""hexokinase
" Neovim default
let g:Hexokinase_highlighters = [ 'virtual' ]

" All possible highlighters
"let g:Hexokinase_highlighters = [
"\   'virtual',
"\   'sign_column',
"\   'background',
"\   'backgroundfull',
"\   'foreground',
"\   'foregroundfull'
"\ ]
"
" All possible values
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

" Filetype specific patterns to match
" entry value must be comma seperated list
let g:Hexokinase_ftOptInPatterns = {
\     'css': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
\     'html': 'full_hex,rgb,rgba,hsl,hsla,colour_names'
\ }

" Sample value, to keep default behaviour don't define this variable
"let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']
"
"markdown conceal disabled
let g:vim_markdown_conceal = 0
let g:tex_conceal = ''
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
"
"
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
