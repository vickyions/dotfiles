set autoindent "autoindent

set smartindent

set autoread
set backspace=indent,eol,start
set nobackup

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set foldmethod=indent
set foldnestmax=2
set nofoldenable
set foldlevel=2

syntax on
set number
"set relativenumber

set laststatus=2
"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %P

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

set mouse=a
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
"Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'mattn/emmet-vim'
"Plug 'sheerun/vim-polyglot'
"Plug 'luochen1990/rainbow'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'tpope/vim-fugitive'
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

""indentline
""let g:indentLine_setColors = 'SpecialKey'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"
""raindbow brackets
"let g:rainbow_active = 1
"let g:rainbow_load_separately = [
"    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
"    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
"    \ ]
"
"let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
"let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"
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
"        colorscheme catppuccin-frappe " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

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

"telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"lua << EOF
"require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules" }} }
"EOF

"treesitter help lua-heredoc
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "javascript", "typescript", "html", "css", "json", "bash" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  -- rainbow /p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    disable = { "jsx" }, --list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings

    }
}


--inden-blankline setup
--indent lua 
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true, --context indent highlighted by treesitter
    show_current_context_start = true,
--   char_highlight_list = {
--       "IndentBlanklineIndent1",
--       "IndentBlanklineIndent2",
--       "IndentBlanklineIndent3",
--       "IndentBlanklineIndent4",
--       "IndentBlanklineIndent5",
--       "IndentBlanklineIndent6",
--   },
}


--web dev icons
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}


--lualine
require('lualine').setup{
    options = {
        theme = 'auto'
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = { 'windows'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location', {'diagnostics',
            sources = {'nvim_diagnostic', 'coc'},
            sections = {'error', 'warn', 'info', 'hint'},

            diagnostic_color = {
                -- Same values as the general color option can be used here.
                error = 'DiagnosticError',
                warn  = 'DiagnosticWarn',
                info  = 'DiagnosticInfo',
                hint  = 'DiagnosticHint',
            },
            symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
            colored = false,
            update_in_insert = false,
            always_visible = false,
            }
        }
    },
}
EOF
