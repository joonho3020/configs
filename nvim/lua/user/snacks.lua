require('snacks').setup({
  indent = {
    enabled = true,
    only_scope = true,
    hl = "SnacksIndent",
    animate = {
      enabled = false,
    }
  },
  scroll = { enabled = false },
  scope = { enable = false },
  statuscolumn = { enabled = false },
  notifier = { timeout = 3000, },
  input = {enable = true },
  quickfile = { enabled = true },
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  words = {enable = false },
  terminal = {
    enable = true,
  },
  image = {
    enabled = false,
  }
})
