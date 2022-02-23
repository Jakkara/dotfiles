
""" GENERAL
" disable backwards compat
set nocompatible
syntax enable
filetype plugin on
filetype indent on
set clipboard=unnamedplus
set hidden

""" SYNTAX & EDITING
set tabstop=2 softtabstop=2 shiftwidth=2
set smartindent
set expandtab
set incsearch
set scrolloff=4
set wildmenu
set undodir=~/.vim/undodir
set undofile

""" STYLE
set cursorline
set hlsearch
hi CursorLine term=bold cterm=bold guibg=lightgrey
set relativenumber
set number
set nowrap
set visualbell
"set colorcolumn=100
"highlight ColorColumn ctermbg=lightmagenta
set signcolumn=no
" unset "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

""" PLUGINS
call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
call plug#end()

""" PLUGIN VARIABLES

let g:vim_markdown_new_list_item_indent = 2

if executable('rg')
    let g:rg_derive_root='true'
endif

""" ABBREVIATIONS

iabbrev <<- ------------------------------------------------------
            \<CR>------------------------------------------------------
iabbrev <<= ============
iabbrev <<c ✓

""" LEADER KEYBINDS
let mapleader = "\<Space>" 

"previous file
nnoremap <leader>gb <c-^><cr> 
"vimrc
nnoremap <leader>vimrc <cmd>e ~/.vimrc<cr>
"notetaking
nnoremap <leader>notes <cmd>e ~/Notes/Notes.md<cr>
"save with doublespace
nnoremap <leader> <cmd>w<cr>
"notetaking
nnoremap <leader>keep <cmd>e ~/Dev/Keep/data-cleaning.md<cr>

""" PLUGIN KEYBINDS

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
""" Undotree
nnoremap <leader>ut <cmd>UndotreeToggle<cr>
