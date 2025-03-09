
require("nvim-tree").setup {
  filters = {
    dotfiles = false,  -- Show hidden files (dotfiles)
    custom = {},       -- Ensure no custom hidden patterns
  },
  git = {
    ignore = false,    -- Show files ignored by .gitignore (important for PDFs)
  },
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
      -- Disables window picker, making files open in the last active window
      window_picker = {
        enable = false,
      },
    },
  },
  on_attach = function(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)

    -- NERDTree-like mappings
    vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "p", api.node.navigate.parent, opts("Go to Parent"))
    vim.keymap.set("n", "r", api.tree.reload, opts("Refresh"))

     -- Unmap <C-e> inside nvim-tree (it is originally open, but just scroll)
    vim.keymap.del("n", "<C-e>", { buffer = bufnr })
  end
}
