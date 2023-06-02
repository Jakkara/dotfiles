""" PLUGINS
call plug#begin()
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'Jakkara/telescope-command-palette.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
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
Plug 'nvie/vim-flake8'
Plug 'mhinz/vim-startify'
Plug 'brooth/far.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
autocmd FileType markdown call plug#begin() | Plug 'Jakkara/vim-checkbox' | call plug#end()

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
" react to terminal size changes and resize splits
autocmd VimResized * wincmd =

""" SYNTAX & EDITING
set tabstop=4 softtabstop=4 shiftwidth=4
set list
set smartindent
set expandtab
set incsearch
set scrolloff=5
set wildmenu
set undodir=/home/jali/.vim/undodir
set undofile
set breakindent
set splitbelow
set splitright
set textwidth=120

""" THEME
function! DraculaHighlights() abort
    highlight EndOfBuffer ctermbg=NONE
    highlight Normal ctermfg=white
    highlight Normal ctermbg=234
    highlight pythonComment ctermfg=4
    highlight CursorLine ctermbg=236
    highlight ColorColumn ctermbg=236
    highlight clear SignColumn
endfunction
augroup Colors
    autocmd!
    autocmd ColorScheme dracula runtime after/plugin/dracula.vim
    autocmd ColorScheme dracula call DraculaHighlights()
augroup END
colorscheme dracula

""" STYLE
set cursorline
set hlsearch
set relativenumber
set number
set nowrap
set visualbell
set colorcolumn=80,120
set signcolumn=number
" unset last search pattern register by hitting return
nnoremap <BS> :noh<CR>
" compat configs for lightline
set noshowmode
set showtabline=2
" better markdown display
set conceallevel=2
" show syntax highlighting in fenced markdown blocks
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'json', 'sql']

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80,120
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    autocmd WinLeave * set colorcolumn=0
augroup END

""" PLUGIN VARIABLES
let g:fern#default_hidden = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1
let g:lightline = {
      \ 'colorscheme': 'OldHope',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified', 'gitbranch' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ [] ],
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
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
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1
let g:startify_session_dir = '~/vim-sessions'
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ ]

""" ABBREVIATIONS

iabbrev <expr> <<d strftime("%Y-%m-%d")

iabbrev §b ```
iabbrev <<- ------------------------------------------------------
            \<CR>------------------------------------------------------
iabbrev <<= ==========
iabbrev <<c ✓

""" CUSTOM KEYBINDS
" unset needless Shift+J command
map <S-j> <Nop>
map ZA <cmd>qa <cr>
" rebind repeat to more useful key
nnoremap § .
" in Visual mode, press n to search for selection occurrences
vnoremap n y/\V<C-R>=escape(@",'/\')<CR><CR>
let mapleader = "\<Space>" 

" move between splits
nnoremap <M-j> <C-W><C-J>
nnoremap <M-k> <C-W><C-K>
nnoremap <M-l> <C-W><C-L>
nnoremap <M-h> <C-W><C-H>
nnoremap <C-q> <C-w>q

" highlight occurrences of current word
nnoremap <leader>* *N

" show marks
nnoremap <leader>m :<C-u>marks<CR>:normal! `

" open terminal
nnoremap <F5> <cmd>bot 16sp \| term <cr>
                
"vimrc
nnoremap <leader>vimrc <cmd>e ~/.vimrc<cr>
nnoremap <leader>rvimrc <cmd>so ~/.vimrc<cr>
"save with doublespace
nnoremap <leader> <cmd>w<cr>
" buffer navigation
nnoremap <C-L> <cmd>bnext<cr>
nnoremap <C-H> <cmd>bprevious<cr>
nnoremap <C-J> :bprevious<bar>bd#<CR>
nnoremap <C-K> <cmd>enew<cr>
nnoremap <leader>bD <cmd>bd!<cr>
" softwrap
nnoremap <leader>w <cmd>set wrap!<cr>

" moving lines
nnoremap <A-S-j> :m+<CR>==
nnoremap <A-S-k> :m-2<CR>==
inoremap <A-S-j> <Esc>:m+<CR>==gi
inoremap <A-S-k> <Esc>:m-2<CR>==gi
vnoremap <A-S-j> :m'>+<CR>gv=gv
vnoremap <A-S-k> :m-2<CR>gv=gv

" Python specific
autocmd FileType python nnoremap <buffer> <leader>R :!python3 %<CR>
" Jump to test file
nnoremap <leader>ft <cmd>execute 'edit **/test_' . resolve(expand('%:t')) <cr>

""" PLUGIN KEYBINDS
" Git + Telescope
nnoremap <leader>gfl <cmd>Telescope git_bcommits<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
" Git + Fugitive
nnoremap <F2> <cmd>G<cr>
nnoremap <F3> <cmd>G log<cr>
nnoremap <leader>ga <cmd>G add %<cr>
nnoremap <leader>gm <cmd>G meld<cr>
nnoremap <leader>gb <cmd>G blame<cr>
nnoremap <leader>gf <cmd>G commit -m "f"<cr>
function MeldToLastCommit()
    let latest_commit = trim(execute('G rev-list -1 HEAD %'))
    execute printf("G commit --no-verify --fixup=%s", latest_commit)
    execute printf("G remake-to %s", latest_commit)
endfunction
nnoremap <leader>glm <cmd>call MeldToLastCommit()<cr>
" Tagbar
nnoremap <leader>t :TagbarToggle<CR>
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fr <cmd>Telescope resume<cr>
nnoremap <leader>fl <cmd>Telescope resume<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fm <cmd>Telescope keymaps<cr>
nnoremap <leader>fz <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fk <cmd>Telescope grep_string initial_mode=normal <cr>
" Telescope, live grep args
" live grep highlighted text
vnoremap <leader>fv "zy:Telescope live_grep initial_mode=normal <cr><C-r>z

" Telescope + command_palette
nnoremap <F1> <cmd>Telescope command_palette<cr>


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
noremap <silent> <leader>e :Fern . -drawer -right -toggle -width=50<CR>
noremap <silent> <Leader>E :Fern . -drawer -right -reveal=% -width=50<CR><C-w>=
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
""" Flake8
autocmd FileType python map <buffer> <F8> :call flake8#Flake8()<CR>
""" Mypy
autocmd FileType python map <buffer> <S-F8> :!mypy %<CR>

" expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

""" SESSION MANAGEMENT, source: https://dockyard.com/blog/2018/06/01/simple-vim-session-management-part-1
let g:sessions_dir = '~/vim-sessions'
exec 'nnoremap <f9> :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <S-f9> :Obsession ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'

" Debug function for getting syntax object for the color scheme
nmap <leader>zo :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <leader>zc <cmd>echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")<cr>

""" External config files
source ~/dotfiles/.coc.vimrc
source ~/dotfiles/.private.vimrc

""" PLUGIN CONFIG
lua <<EOF
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

require('telescope').setup({
    extensions = {
        command_palette = {
            {"Git",
                {"Add, current file", ":G add %"},
                {"Diff, current file", ":G diff %"},
            },
            {"Vim",
                {"Autosave", ":autocmd CursorHold <buffer> silent write"},
                {"Copy current file path", "let @+ = expand('%')"},
            },
            {"Pyright",
                {"Restart server", ":CocCommand pyright.restartserver"},
            },
        }
    }
})
require('telescope').load_extension('command_palette')

vim.keymap.set('n', '<leader>fa', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })
require("telescope").load_extension("live_grep_args")

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gn",
      node_incremental = "gm",
      node_decremental = "gl",
    },
  },
}
EOF

function TeleVert ()
    lua << EOF
    require('telescope').setup{
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          height = 0.95,
          width = 0.90
        }
      }
    }
EOF
endfunction
function TeleHorizon ()
    lua << EOF
    require('telescope').setup{
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          height = 0.95,
          width = 0.90
        }
      }
    }
EOF
endfunction
