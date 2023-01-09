set nocompatible  " Use Vim settings, rather than Vi settings

set softtabstop=4 " Indent by 4 spaces when hitting tab
set tabstop=4   " Show existing tab with 4 spaces width
set shiftwidth=4  " Indent by 4 spaces when auto-indenting
set expandtab

set foldmethod=syntax
"set foldnestmax=2
set nofoldenable
"set foldlevel=2

syntax on     " Enable syntax highlighting
"filetype indent on " Enable indenting for files
"set paste "avoids indentations while pasting
"set autoindent   " Enable auto indentingi from previous lines
set smartindent
"set cindent
set number      " Enable Line numbers
set relativenumber  " Enbales relative numbers if numbers are enable

set laststatus=2  " Show status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %P
set wildmenu    " Display command line's tab complete options as a menu
" Swap file management
set swapfile
set directory=$HOME/.vim/swp//
"
" Backup file management
set backup
set backupdir=$HOME/.vim/.backup//
"
set history=1000  " Bigger history of executed commands
set showcmd     " Show incomplete commands at the bottom
set showmode    " current mode at bottom
set ruler     " always show cursor position
"set cursorline   " Highlight the line currently under cursor
"set cursorcolumn
"au Colorscheme * hi CursorLine cterm=NONE ctermbg=235
set mouse=a     " Enable mouse for scrolling and resizing
set background=dark " Use colors that suit a dark background
set title     " set window title reflecting the file currently being edited in format of FILENAME(PATH) - VIM
"set nowrap     " Don't wrap lines
set linebreak   " Wrap lines at convenient points avoid wrapping line in the middle of a word
"set spell      " Spell checking
set spelllang=en  " Spell checking language
"set visualbell    " Flash the screen instead of beeping on errors
set scrolloff=8
set colorcolumn=80
filetype off                  " required


"completeopt
"set omnifunc=csscomplete#CompleteCss
"set omnifunc=htmlcomplete#CompleteTags

"vim-polyglot
let g:polyglot_disabled = ['autoindent']
let g:polyglot_disabled = ['ftdetect']

"""""""""

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'ycm-core/YouCompleteMe' "autocompletion
Plugin 'Yggdroot/indentLine'    "indentation lines
Plugin 'preservim/nerdtree'     "Nerdtree
Plugin 'tpope/vim-surround'      "managing quote pairs and replacing and advance stuff :help surround
Plugin 'raimondi/delimitmate'   "auto pairing of quotes brackets etc
Plugin 'luochen1990/rainbow'      "rainbow brackets
" Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'sheerun/vim-polyglot'
" post install (yarn install | npm install) then load plugin only for editing supported files
" javascript typescript cs less scss json graphql markdown vue svelte yaml html
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'css', 'less', 'json', 'markdown', 'yaml', 'html'] }
"Plugin 'arcticicestudio/nord-vim'
Plugin 'KabbAmine/zeavim.vim'
"Plugin 'dylanaraps/wal.vim'
Plugin 'dense-analysis/ale'
"Plugin 'scrooloose/syntastic'
"Plugin 'vim-airline/vim-airline'   "statusline/tabline
"Plugin 'godlygeek/tabular'     "aligning made easy and filtering
" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

"markdown conceal disabled
let g:vim_markdown_conceal = 0
let g:tex_conceal = ''
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
"
"indentline plugins settings
let g:indentLine_enabled = 0
let g:indentLine_setColors = 'SpecialKey'
let g:indentLine_defaultGroup = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"nvim indentation wrong toggle fixes it??
augroup indentToggle
  au!
  autocmd VimEnter * IndentLinesEnable
augroup END
"
"rainbow
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

""sytastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"ale setting
let g:ale_linters = {
      \ 'html': ['vscode-html-language-server','prettier'],
      \ 'css': ['stylelint','vscode-css-language-server','prettier'],
      \ 'json': ['vscode-json-language-server','prettier'],
      \ 'js': ['eslint','vscode-eslint-language-server','prettier'],
      \}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines','trim_whitespace'],
      \ 'c': ['clang-format'],
      \ 'cpp': ['clang-format'],
      \ 'tex': ['latexindent'],
      \ 'html': ['tidy','prettier'],
      \ 'css': ['stylelint','prettier'],
      \ 'js': ['eslint','importjs'],
      \ 'json': ['jq','prettier'],
      \ 'python': ['yapf','autoimport','autoflake']
      \}
let g:ale_enabled = 1
"let g:ale_lint_on_text_changed = "always"
"let g:ale_lint_delay = 500

" run linter when file is saved
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

"let g:ale_fix_on_save = 1
"others
""vim-javascript
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1
"let g:javascript_plugin_flow = 1

"YOUCOMPLETEME
let g:ycm_complete_in_strings = 1 "ycm shows completeion in comments 
let g:ycm_autoclose_preview_window_after_completion = 1 "auto close completeion window
let g:ycm_autoclose_preview_window_after_insertion = 1 "auto close completeion window
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_auto_hover = 6000
"let g:ycm_semantic_triggers = {
"      \   'css': [ 're!^', 're!^\s+', ': ' ],
"    \   'scss': [ 're!^', 're!^\s+', ': ' ],
"    \ }
"
"Surround shortcuts
""cs"' ysiw] ds" cst" changesurround"' deletesurround" ysInsideWordto] [hello]
"deletesurround" also in V mode to put the selected line inside something do
""S<p> will put all line inside <p> .... </p>
"wrap whole line in something do yss)
""
"Prettier settings
"set expandtab "use spaces to render tabs
let g:prettier#config#use_tabs = 'false' "uses expandtab settings. Use tabs 
"instead of spaces
"
""gruvbox

colorscheme gruvbox   " Set nice looking colorschemes
"autocmd VimEnter * hi Normal ctermbg=none
"""
