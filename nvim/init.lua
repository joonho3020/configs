-- Initialize lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
  'folke/tokyonight.nvim',
  'andymass/vim-matchup',
  'machakann/vim-highlightedyank',
  'junegunn/vim-slash',
  'nvim-lualine/lualine.nvim',
  'akinsho/bufferline.nvim',
  'famiu/bufdelete.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'rcarriga/nvim-notify',
  'petertriho/nvim-scrollbar',
  'airblade/vim-gitgutter',
  'akinsho/git-conflict.nvim',
  'tpope/vim-fugitive',
  'junegunn/gv.vim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'scalameta/nvim-metals',
  'L3MON4D3/LuaSnip',
  'NoahTheDuke/vim-just',
  'chrisbra/vim-commentary',
  'stevearc/stickybuf.nvim',
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
})

-- General Settings
vim.cmd [[
  syntax on
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set colorcolumn=79
  set listchars=tab:>·,trail:~,extends:>,precedes:<
  set list
  set background=dark
  set backspace=indent,eol,start
  set nowrap
  set number
  set relativenumber
  set showcmd
  set cursorline
  set showmatch
  set wildmenu
  set updatetime=100
  set ttyfast
  set mouse+=a
  set encoding=utf-8
  set ttimeout
  set ttimeoutlen=50
  set clipboard=unnamedplus
  filetype indent on
  filetype plugin on
  let g:python_recommended_style=0
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
  set shortmess-=F
  set noshowmode
  set laststatus=2
  set hidden
  set autowrite
  set termguicolors
  set foldmethod=manual
  colorscheme tokyonight-night
  highlight WinSeparator guifg=#394b70 guibg=None
]]

-- Termdebug configuration
vim.cmd [[
  packadd termdebug
  let g:termdebug_wide=1
  let g:termdebug_leftsource = 1
  let g:termdebug_focussource = 1
  let g:termdebug_disable_toolbar = 1
  hi debugPC term=reverse ctermbg=8 guibg=darkblue
" change termdebug path
" let g:termdebugger="/scratch/joonho.whangbo/coding/the-one-profiler/chipyard/.conda-env/riscv-tools/bin/riscv64-unknown-linux-gnu-gdb"
]]

-- disable netrw at the very start of your init.lua (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- disable gitgutter from nvimtree buffers
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "NvimTree_*",
  command = "GitGutterBufferDisable",
})

-- Conflict marker settings
vim.g.conflict_marker_enable_mappings = 0
vim.g.conflict_marker_enable_matchit = 0

-- Highlight the color column
vim.cmd [[highlight ColorColumn ctermbg=darkgray]]

 -- run the 'open' command on the current buffer
vim.api.nvim_create_user_command('Rfinder',
 function()
   local path = vim.api.nvim_buf_get_name(0)
   local path_format =  string.format('%q', path)
   os.execute('open ' .. path_format)
 end,
 {}
)

--------------------------------------------------------------
-- Key mappings
--------------------------------------------------------------

-- Leader key
vim.g.mapleader = ' '

-- Faster scroll
vim.api.nvim_set_keymap('n', '<C-e>', '10<C-e>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-y>', '10<C-y>', { noremap = true, silent = true })

-- termdebug exit terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Better window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- move btw buffers
vim.api.nvim_set_keymap('n', '<Tab>',   ':bnext<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- LSP Mappings
local opts = { buffer = bufnr, noremap = true, silent = true }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

vim.notify = require("notify")

--------------------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------------------
require "user.telescope"
require "user.metals"
require "user.lsp"
require "user.bufferline"
require "user.tokyonight"
require "user.nvimtree"
require "user.noice"
require "user.snacks"

require("scrollbar").setup()
require("lualine").setup()

local wk = require("which-key")
wk.add({
  -- Grep
  { "<leader>/",  function() Snacks.picker.grep() end,        desc = "Grep",                        mode = "n" },
  -- Find
  { "<leader>ff", "<cmd>Telescope find_files<cr>",            desc = "Find File",                   mode = "n" },
  { "<leader>fw", "<cmd>Telescope live_grep<cr>",             desc = "Find Words",                  mode = "n" },
  { "<leader>fg", "<cmd>Telescope grep_string<cr>",           desc = "Find Word Under Cursor",      mode = "n" },
  { "<leader>fb", function() Snacks.picker.buffers() end,     desc = "Find buffers",                mode = "n" },
  -- Buffer
  { "<leader>bd", ":Bdelete<cr>",                             desc = "Bdelete",                     mode = "n" },
  { "<leader>bp", ":BufferLineTogglePin<cr>",                 desc = "Buffer (Un)Pin",              mode = "n" },
  -- git
  { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
  { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
  { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
  { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
  { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
  { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
  { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
  -- Markdown
  { "<leader>md", ":RenderMarkdown disable<cr>",              desc = "Disable markdown render",     mode = "n" },
  { "<leader>mp", ":MarkdownPreview<cr>",                     desc = "Preview markdown in browser", mode = "n" },
  -- Etc
  { "<leader>o",  ":Rfinder<cr>",                             desc = "Mac \"open\" on the buffer",  mode = "n" },
  { "<leader>e",  "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostic",             mode = "n" },
  { "<leader>x",  ":NoiceDismiss<cr>",                        desc = "Dismiss noice messages",      mode = "n" },
  { "<leader>h", hidden = true }, -- hide this keymap
})
