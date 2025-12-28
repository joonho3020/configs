
require("tokyonight").setup({
  lazy = false,
  style = "night",
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { italic = false },
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  on_colors = function(colors)
    colors.bg = "#171821"
    colors.bg_dark1 = "#101010"
    colors.border = "#101010"
    colors.fg = "#CFE2F3"
  end,
  on_highlights = function(hl, c)
     hl.NvimTreeNormal = { bg = "#0d0e14" }
     hl.NvimTreeWinSeparator = { fg = "#7dcfff", bg = "#0d0e14" }
  end,
  cache = true,
  plugins = {
    all = package.loaded.lazy == nil,
    auto = true,
  },
})
