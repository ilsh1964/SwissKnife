" VIMRC Version: 1.2
" Shavit Ilan 2016-06-27
"
" VUNDLE PLUGIN
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Supertab plugin
Plugin 'ervandew/supertab'

" WriteBackup Plugin
Plugin 'vim-scripts/writebackup'

" SearchComplete Plugin
Plugin 'vim-scripts/SearchComplete'

" NerdTree Plugin
Plugin 'scrooloose/nerdtree'

" CTRL+P Plugin
Plugin 'ctrlp.vim'

" Syntax checker Plugin
Plugin 'scrooloose/syntastic'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins. append `!` to auto-approve removal
" 
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"==================================================

filetype plugin on " load filetype plugins

" *****************  Martin tips: (vim as python ide)

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
set pastetoggle=<F2>
set clipboard+=unnamed

" Mouse and backspace
set mouse=r  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Rebind <Leader> key
let mapleader = ","

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks: select code in visual mode and press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set nobackup
set nowritebackup
set noswapfile

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"set t_Co=256
colorscheme evening

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrl+p
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
" set foldmethod=manual 
" set nofoldenable

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" let g:jedi#related_names_command = "<leader>z"
" let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" ***************** End Martin tips: (vim as python ide)

" Show hide invisible character 
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬


set ruler " Always show current positions along the bottom 
set wildmenu " turn on wild menu
set noerrorbells " don't make noise
set showmatch " show matching brackets
set ai " autoindent
set si " smartindent 
set guioptions-=T "Remove toolbar
set guioptions-=m "Remove menu
au BufWinLeave * mkview

"python definition 
set autoindent "when you press RETURN new line is created with the right indent 
set cpoptions+=$

" Run F5 to run python scripts
map <F5> :!python %<cr>
command P :!python %

"Hebrew:
" :set invrl - change keyborad to hebrew and vice versa
" F9 key for right to left writing in command mode
map <F9> <Esc>:set invrl<CR>a
"F9 key for right to keft writing in insert mode
imap <F9> <Esc>:set invrl<CR>a

" Write Backup Plugin
command W :WriteBackup
map <F4> <Esc> :WriteBackup

" Force saving the file with sudo
command S :w !sudo tee % >/dev/null


