---------- PLUGINS ----------
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('airblade/vim-gitgutter')
Plug('antoinemadec/FixCursorHold.nvim')
Plug('christoomey/vim-tmux-navigator')
Plug('danymat/neogen')
Plug('fannheyward/telescope-coc.nvim')
Plug('godlygeek/tabular')
Plug('itchyny/lightline.vim')
Plug('Jakkara/vim-checkbox')
Plug('jremmen/vim-ripgrep')
Plug('kdheepak/lazygit.nvim')
Plug('lambdalisue/fern-git-status.vim')
Plug('lambdalisue/fern.vim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('machakann/vim-sandwich')
Plug('mengelbrecht/lightline-bufferline')
Plug('mhinz/vim-startify')
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope-live-grep-args.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('sainnhe/sonokai')
Plug('tpope/vim-abolish')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-obsession')
Plug('tpope/vim-repeat')
vim.call('plug#end')

---------- GENERAL ----------
vim.opt.clipboard = 'unnamedplus'
vim.opt.hidden = true
vim.opt.showcmd = true
vim.opt.ttimeout = true
vim.opt.timeout = false
vim.opt.autoread = true
vim.opt.updatetime = 750
vim.opt.mouse = 'a'
vim.opt.shortmess:append('c')

-- React to terminal size changes and resize splits
vim.api.nvim_create_autocmd('VimResized', { command = 'wincmd =' })

-- Always paste without replacing clipboard buffer
vim.keymap.set('v', 'p', 'P')

---------- SYNTAX & EDITING ----------
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.listchars = { tab = '>-', trail = '-', lead = '·' }
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.scrolloff = 3
vim.opt.wildmenu = true
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true
vim.opt.breakindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true

---------- THEME ----------
vim.opt.termguicolors = true
vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_colors_override = { bg0 = { '#000000', '235' } }
vim.cmd.colorscheme('sonokai')

---------- STYLE ----------
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.visualbell = true
vim.opt.colorcolumn = '80,120'
vim.opt.signcolumn = 'number'
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.g.markdown_fenced_languages = { 'html', 'python', 'bash=sh', 'json', 'sql' }

-- Clear search highlight with backspace
vim.keymap.set('n', '<BS>', '<cmd>noh<CR>')

-- Dim inactive windows
local bg_highlight = vim.api.nvim_create_augroup('BgHighlight', { clear = true })
vim.api.nvim_create_autocmd('WinEnter', {
  group = bg_highlight,
  callback = function()
    vim.opt_local.colorcolumn = '80,120'
    vim.opt_local.cursorline = true
  end,
})
vim.api.nvim_create_autocmd('WinLeave', {
  group = bg_highlight,
  callback = function()
    vim.opt_local.cursorline = false
    vim.opt_local.colorcolumn = '0'
  end,
})

---------- PLUGIN VARIABLES ----------
vim.g['fern#default_hidden'] = 1
vim.g['fern#renderer#default#leading'] = '>  '
vim.g.vim_markdown_new_list_item_indent = 0
vim.g.vim_markdown_folding_disabled = 1

vim.g.lightline = {
  colorscheme = 'sonokai',
  active = {
    left = { { 'mode', 'paste' }, { 'readonly', 'relativepath', 'modified', 'gitbranch' } },
  },
  tabline = {
    left = { { 'buffers' } },
    right = { {} },
  },
  component_expand = {
    buffers = 'lightline#bufferline#buffers',
  },
  component_function = {
    gitbranch = 'FugitiveHead',
  },
  component_type = {
    buffers = 'tabsel',
  },
}
vim.g['lightline#bufferline#show_number'] = 2

if vim.fn.executable('rg') == 1 then
  vim.g.rg_derive_root = 'true'
end

vim.g.startify_session_dir = '~/vim-sessions'
vim.g.startify_lists = {
  { type = 'sessions', header = { '   Sessions' } },
}

---------- CUSTOM KEYBINDS ----------
vim.keymap.set('', '<S-j>', '<Nop>')
vim.keymap.set('', 'ZA', '<cmd>qa<cr>')
vim.keymap.set('n', '§', '.')
-- In Visual mode, search for selection occurrences
vim.keymap.set('v', 'n', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])

vim.g.mapleader = ' '

vim.keymap.set('n', '<Leader>v', '<cmd>vsplit<cr>')
vim.keymap.set('n', '<Leader>s', '<cmd>split<cr>')

-- vim-tmux-navigator
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set('n', '<M-h>', '<cmd>TmuxNavigateLeft<cr>', { silent = true })
vim.keymap.set('n', '<M-j>', '<cmd>TmuxNavigateDown<cr>', { silent = true })
vim.keymap.set('n', '<M-k>', '<cmd>TmuxNavigateUp<cr>', { silent = true })
vim.keymap.set('n', '<M-l>', '<cmd>TmuxNavigateRight<cr>', { silent = true })
vim.keymap.set('n', '<C-q>', '<C-w>q')

-- Save with double space
vim.keymap.set('n', '<leader>', '<cmd>w<cr>')

-- Buffer navigation
vim.keymap.set('n', '<C-l>', '<cmd>bnext<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<C-j>', '<cmd>bprevious<bar>bd#<cr>')
vim.keymap.set('n', '<C-k>', '<cmd>enew<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bd!<cr>')
vim.keymap.set('n', '<leader>w', '<cmd>set wrap!<cr>')

-- Moving lines
vim.keymap.set('n', '<A-S-j>', ':m+<CR>==')
vim.keymap.set('n', '<A-S-k>', ':m-2<CR>==')
vim.keymap.set('i', '<A-S-j>', '<Esc>:m+<CR>==gi')
vim.keymap.set('i', '<A-S-k>', '<Esc>:m-2<CR>==gi')
vim.keymap.set('v', '<A-S-j>', ":m'>+<CR>gv=gv")
vim.keymap.set('v', '<A-S-k>', ':m-2<CR>gv=gv')

---------- FILETYPE AUTOCMDS ----------
local python_group = vim.api.nvim_create_augroup('python_specific', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = python_group,
  pattern = 'python',
  callback = function()
    vim.keymap.set('n', '<leader>R', ':!python3 %<CR>', { buffer = true })
    vim.keymap.set('n', '<leader>ft', function()
      vim.cmd("edit **/test_" .. vim.fn.fnamemodify(vim.fn.resolve(vim.fn.expand('%:t')), ':t'))
    end, { buffer = true })
  end,
})

local js_group = vim.api.nvim_create_augroup('javascript_specific', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = js_group,
  pattern = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
    vim.cmd('iabbrev <buffer> clg console.log(')
    vim.cmd('iabbrev <buffer> ITS it("should ", async () => {});')
  end,
})

---------- PLUGIN KEYBINDS ----------
-- Git + Fugitive
vim.keymap.set('n', '<F2>', '<cmd>vertical G<cr>')
vim.keymap.set('n', '<F3>', '<cmd>vertical G log<cr>')
vim.keymap.set('n', '<F4>', '<cmd>vertical G log %<cr>')
vim.keymap.set('n', '<leader>ga', '<cmd>G add %<cr>')
vim.keymap.set('n', '<leader>gb', '<cmd>G blame<cr>')
vim.keymap.set('n', '<leader>gl', '<cmd>LazyGit<cr>', { silent = true })

vim.cmd([[
function! MeldToLastCommit()
    let latest_commit = trim(execute('G rev-list -1 HEAD %'))
    execute printf("G commit --no-verify --fixup=%s", latest_commit)
    execute printf("G remake-to %s", latest_commit)
endfunction
]])
vim.keymap.set('n', '<leader>gM', '<cmd>call MeldToLastCommit()<cr>')
vim.keymap.set('n', '<leader>gm', '<cmd>G meld<cr>')

vim.cmd([[
function! FixupAndRebaseToCommit(commit_hash)
    execute 'G commit --fixup ' . a:commit_hash
    execute 'G remake-to ' . a:commit_hash
endfunction
command! -nargs=1 Gfix call FixupAndRebaseToCommit(<f-args>)
]])

-- Tagbar
vim.keymap.set('n', '<leader>t', '<cmd>TagbarToggle<cr>')

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope resume<cr>')
vim.keymap.set('n', '<leader>fp', '<cmd>Telescope pickers initial_mode=normal<cr>')
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>fq', '<cmd>Telescope quickfix<cr>')
vim.keymap.set('n', '<leader>fm', '<cmd>Telescope keymaps<cr>')
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope grep_string initial_mode=normal<cr>')
vim.keymap.set('n', '<leader>fu', '<cmd>Telescope coc references initial_mode=normal<cr>')

-- Bufferline (go + delete, numbered 1-10)
for i = 1, 10 do
  local key = i == 10 and '0' or tostring(i)
  vim.keymap.set('n', '<Leader>' .. key, '<Plug>lightline#bufferline#go(' .. i .. ')')
  vim.keymap.set('n', '<Leader>c' .. key, '<Plug>lightline#bufferline#delete(' .. i .. ')')
end

-- Fern
vim.keymap.set('n', '<leader>E', '<cmd>Fern . -drawer -right -toggle -width=80<cr>', { silent = true })
vim.keymap.set('n', '<leader>R', '<cmd>Fern . -drawer -right -reveal=% -width=80<cr><C-w>=', { silent = true })

local fern_group = vim.api.nvim_create_augroup('FernEvents', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = fern_group,
  pattern = 'fern',
  callback = function()
    local opts = { buffer = true }
    vim.cmd([[
      nmap <buffer><expr> <Plug>(fern-my-open-expand-collapse)
            \ fern#smart#leaf(
            \   "\<Plug>(fern-action-open:select)",
            \   "\<Plug>(fern-action-expand)",
            \   "\<Plug>(fern-action-collapse)",
            \ )
    ]])
    vim.keymap.set('n', '<CR>', '<Plug>(fern-my-open-expand-collapse)', opts)
    vim.keymap.set('n', '<2-LeftMouse>', '<Plug>(fern-my-open-expand-collapse)', opts)
    vim.keymap.set('n', 'm', '<Plug>(fern-action-mark:toggle)', opts)
    vim.keymap.set('n', 'N', '<Plug>(fern-action-new-file)', opts)
    vim.keymap.set('n', 'K', '<Plug>(fern-action-new-dir)', opts)
    vim.keymap.set('n', 'D', '<Plug>(fern-action-remove)', opts)
    vim.keymap.set('n', 'C', '<Plug>(fern-action-move)', opts)
    vim.keymap.set('n', 'R', '<Plug>(fern-action-rename)', opts)
  end,
})

-- Flake8 / Mypy
local lint_group = vim.api.nvim_create_augroup('PythonLint', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = lint_group,
  pattern = 'python',
  callback = function()
    vim.keymap.set('n', '<F8>', '<cmd>call flake8#Flake8()<cr>', { buffer = true })
    vim.keymap.set('n', '<S-F8>', '<cmd>!mypy %<cr>', { buffer = true })
  end,
})

-- expand-region
vim.keymap.set('v', 'v', '<Plug>(expand_region_expand)')
vim.keymap.set('v', '<C-v>', '<Plug>(expand_region_shrink)')

---------- SESSION MANAGEMENT ----------
local sessions_dir = '~/vim-sessions'
vim.keymap.set('n', '<F9>', ':so ' .. sessions_dir .. '/*.vim<C-D><BS><BS><BS><BS><BS>')
vim.keymap.set('n', '<S-F9>', ':Obsession ' .. sessions_dir .. '/*.vim<C-D><BS><BS><BS><BS><BS>')

---------- DEBUG: SYNTAX INSPECTION ----------
vim.keymap.set('n', '<leader>zo', function()
  local stack = vim.fn.synstack(vim.fn.line('.'), vim.fn.col('.'))
  local names = vim.tbl_map(function(id) return vim.fn.synIDattr(id, 'name') end, stack)
  print(vim.inspect(names))
end)
vim.keymap.set('n', '<leader>zc', function()
  local id = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)
  print(vim.fn.synIDattr(vim.fn.synIDtrans(id), 'fg'))
end)

---------- COC CONFIG ----------
-- Source the CoC vimscript config (keybinds, completion, etc.)
vim.cmd('source ~/dotfiles/.coc.vimrc')

---------- PLUGIN SETUP ----------
require('neogen').setup({})

require('ibl').setup({
  scope = {
    show_end = false,
    show_start = false,
  },
})

-- Merged telescope setup (was two separate calls in the original)
require('telescope').setup({
  defaults = {
    cache_picker = { num_pickers = 10 },
    file_ignore_patterns = { 'poetry.lock' },
    layout_strategy = 'vertical',
    layout_config = {
      height = 0.95,
      width = 0.90,
    },
  },
  extensions = {
    coc = {
      prefer_locations = true,
    },
  },
})
vim.keymap.set('n', '<leader>fa', require('telescope').extensions.live_grep_args.live_grep_args, { noremap = true })
require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('coc')

require('nvim-treesitter').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gn',
      node_incremental = 'gm',
      node_decremental = 'gl',
    },
  },
})
