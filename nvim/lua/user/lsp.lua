-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Mason setup
require("mason").setup()
-- require("mason-lspconfig").setup()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  'clangd',
  'metals',
  'pylyzer',
  'ts_ls',
  'marksman',
  'bashls',
  'gopls',
  'lua_ls',
  'rust_analyzer',
  'cssls',
  'jsonls',
  'just',
  'tinymist',
}

local function configure_server(name, opts)
  vim.lsp.config(name, opts or {})
  vim.lsp.enable(name)
end

for _, lsp in ipairs(servers) do
  configure_server(lsp, {
    -- on_attach = true,
    capabilities = capabilities,
  })
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
}

-- Swift LSP setup (https://chrishannah.me/using-a-swift-lsp-in-neovim/)
-- Requirements is that you need to have SourceKit-LSP installed and in $PATH
-- (most likely this is already there if you installed xcode)
local swift_lsp = vim.api.nvim_create_augroup("swift_lsp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "swift" },
  callback = function()
    local root_dir = vim.fs.dirname(vim.fs.find({
      "Package.swift",
      ".git",
    }, { upward = true })[1])
    local client = vim.lsp.start({
      name = "sourcekit-lsp",
      cmd = { "sourcekit-lsp" },
      root_dir = root_dir,
    })
    vim.lsp.buf_attach_client(0, client)
  end,
  group = swift_lsp,
})

-- [Adding other filetypes](https://github.com/neovim/nvim-lspconfig/issues/3186)
configure_server('ltex', {
  capabilities = capabilities,
  filetypes = { "latex", "typst", "typ", "bib", "markdown", "plaintex", "tex", "quarto" },
  settings = {
    ltex = {
      enabled = { "latex", "typst", "typ", "bib", "markdown", "plaintex", "tex", "quarto" },
    }
  }
})
