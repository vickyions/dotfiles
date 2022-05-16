set nocompatible	" Use Vim settings, rather than Vi settings
set softtabstop=4	" Indent by 2 spaces when hitting tab
set shiftwidth=4	" Indent by 4 spaces when auto-indenting
set tabstop=4		" Show existing tab with 4 spaces width
syntax on			" Enable syntax highlighting
filetype indent on	" Enable indenting for files
set autoindent		" Enable auto indentingi from previous lines
set number			" Enable Line numbers
set relativenumber	" Enbales relative numbers if numbers are enable
"colorscheme wal		" Set nice looking colorschemes
set laststatus=2	" Show status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %P
set wildmenu		" Display command line's tab complete options as a menu
"
" Swap file management
" set noswapfile
set directory=$HOME/.vim/swp//
"
" Backup file management
" set nobackup
set backupdir=$HOME/.vim/.backup//
"
set history=1000	" Bigger history of executed commands
set showcmd			" Show incomplete commands at the bottom
set showmode		" current mode at bottom
set ruler			" always show cursor position
"set cursorline		" Highlight the line currently under cursor
"au Colorscheme * hi CursorLine cterm=NONE ctermbg=235
set mouse=a			" Enable mouse for scrolling and resizing
set background=light	" Use colors that suit a dark background
set title			" set window title reflecting the file currently being edited in format of FILENAME(PATH) - VIM
"set nowrap			" Don't wrap lines
set linebreak		" Wrap lines at convenient points avoid wrapping line in the middle of a word
"set spell			" Spell checking
set spelllang=en	" Spell checking language
set visualbell		" Flash the screen instead of beeping on errors

filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=$HOME/.vim/bundle/Vundle.vim
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

"Plugin 'ycm-core/YouCompleteMe'	"autocompletion
Plugin 'Yggdroot/indentLine'		"indentation lines
Plugin 'preservim/nerdtree'		  "Nerdtree
Plugin 'tpope/vim-surround'		  "managing quote pairs and replacing and advance stuff :help surround
Plugin 'raimondi/delimitmate'	  "auto pairing of quotes brackets etc
Plugin 'luochen1990/rainbow'		  "rainbow brackets
" Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'dylanaraps/wal.vim'
"Plugin 'vim-airline/vim-airline'	  "statusline/tabline
"Plugin 'godlygeek/tabular'			"aligning made easy and filtering
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
"indentline plugins settings
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"rainbow
let g:rainbow_active = 1

colorscheme wal
