""" PLUGINS
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

""" GENERAL
" disable backwards compat
set nocompatible
syntax enable
" detect filetype and indenting rules per language
filetype plugin on
filetype indent on
" save to OS clipboard
set clipboard=unnamedplus
set hidden
set showcmd
set ttimeout
set notimeout
set autoread
" CoC: Don't pass messages to |ins-completion-menu|.
set updatetime=750
set mouse=a
set shortmess+=c

""" SYNTAX & EDITING
set tabstop=4 softtabstop=4 shiftwidth=4
set smartindent
set expandtab
set incsearch
set scrolloff=8
set wildmenu
set undodir=/home/jali/.vim/undodir
set undofile
set breakindent
set splitbelow
set splitright

""" STYLE
colorscheme dracula
set cursorline
set hlsearch
set relativenumber
set number
set nowrap
set visualbell
set colorcolumn=80,120
set signcolumn=number
hi CursorLine term=bold cterm=bold guibg=235 ctermbg=235
highlight ColorColumn ctermbg=235
highlight clear SignColumn
" unset last search pattern register by hitting return
nnoremap <S-CR> :noh<CR>
" compat configs for lightline
set noshowmode
set showtabline=2
" better markdown display
set conceallevel=1

""" PLUGIN VARIABLES
let g:fern#default_hidden = 1
let g:vim_markdown_new_list_item_indent = 0
let g:lightline = {
      \ 'colorscheme': 'OldHope',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ [] ],
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }
let g:lightline#bufferline#show_number = 2
if executable('rg')
    let g:rg_derive_root='true'
endif
let g:tagbar_width = 40

""" PLUGIN CONFIG
lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "poetry.lock" },
    layout_strategy = 'horizontal',
    layout_config = {
      height = 0.95,
      width = 0.90
    }
  }
}
EOF

""" ABBREVIATIONS

iabbrev <expr> <<d strftime("%Y-%m-%d")

iabbrev <<- ------------------------------------------------------
            \<CR>------------------------------------------------------
iabbrev <<= ============
iabbrev <<c ✓

""" CUSTOM KEYBINDS
" unset needless Shift+J command
map <S-j> <Nop>
let mapleader = "\<Space>" 

" move between splits
nnoremap <M-j> <C-W><C-J>
nnoremap <M-k> <C-W><C-K>
nnoremap <M-l> <C-W><C-L>
nnoremap <M-h> <C-W><C-H>

"vimrc
nnoremap <leader>vimrc <cmd>e ~/.vimrc<cr>
nnoremap <leader>rvimrc <cmd>so ~/.vimrc<cr>
"notetaking
nnoremap <leader>notes <cmd>e ~/Notes/Notes.md<cr>
"save with doublespace
nnoremap <leader> <cmd>w<cr>
"buffer commands
nnoremap <leader>bc <cmd>enew<cr>
nnoremap <leader>bn <cmd>bn<cr>
nnoremap <leader>bd <cmd>bd<cr>
nnoremap <leader>bD <cmd>bd!<cr>
" buffer navigation
nnoremap <C-L> <cmd>bnext<cr>
nnoremap <C-H> <cmd>bprevious<cr>
nnoremap <C-J> <cmd>bdelete<cr>
nnoremap <C-K> <cmd>enew<cr>
" softwrap
nnoremap <leader>w <cmd>set wrap!<cr>

" moving lines
nnoremap <A-S-j> :m+<CR>==
nnoremap <A-S-k> :m-2<CR>==
inoremap <A-S-j> <Esc>:m+<CR>==gi
inoremap <A-S-k> <Esc>:m-2<CR>==gi
vnoremap <A-S-j> :m'>+<CR>gv=gv
vnoremap <A-S-k> :m-2<CR>gv=gv


""" PLUGIN KEYBINDS
" Tagbar
map <leader>t :TagbarToggle<CR>
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <M-k> <cmd>Telescope grep_string initial_mode=normal <cr>
" live grep highlighted text
vnoremap <leader>fv "zy:Telescope live_grep initial_mode=normal default_text=<C-r>z<cr>
" Telescope + Git
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gbc <cmd>Telescope git_bcommits<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>

""" Bufferline
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)
""" Fern, configs from https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html
noremap <silent> <leader>e :Fern . -drawer -toggle -width=40<CR>
noremap <silent> <Leader>E :Fern . -drawer -reveal=% -width=40<CR><C-w>=
function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> m <Plug>(fern-action-mark:toggle)
  nmap <buffer> N <Plug>(fern-action-new-file)
  nmap <buffer> K <Plug>(fern-action-new-dir)
  nmap <buffer> D <Plug>(fern-action-remove)
  nmap <buffer> C <Plug>(fern-action-move)
  nmap <buffer> R <Plug>(fern-action-rename)
endfunction

augroup FernEvents
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

""" SESSION MANAGEMENT, source: https://dockyard.com/blog/2018/06/01/simple-vim-session-management-part-1
let g:sessions_dir = '~/vim-sessions'
exec 'nnoremap <f8> :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <S-f8> :Obsession ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'

""" External config files
source ~/dotfiles/.coc.vimrc
source ~/dotfiles/.private.vimrc
