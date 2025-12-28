-- Contrast adjustment state
local contrast_level = 0
local contrast_step = 10

-- Base colors (your original values)
local base_colors = {
  bg = { r = 0x17, g = 0x18, b = 0x21 },
  bg_dark1 = { r = 0x10, g = 0x10, b = 0x10 },
  border = { r = 0x10, g = 0x10, b = 0x10 },
  nvimtree_bg = { r = 0x0d, g = 0x0e, b = 0x14 },
}

-- Helper to clamp value between 0 and 255
local function clamp(val)
  return math.max(0, math.min(255, math.floor(val)))
end

-- Adjust color brightness (negative = darker, positive = lighter)
local function adjust_color(color, amount)
  return string.format("#%02x%02x%02x",
    clamp(color.r + amount),
    clamp(color.g + amount),
    clamp(color.b + amount)
  )
end

-- Function to apply tokyonight with current contrast
local function apply_tokyonight()
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
      colors.bg = adjust_color(base_colors.bg, contrast_level)
      colors.bg_dark1 = adjust_color(base_colors.bg_dark1, contrast_level)
      colors.border = adjust_color(base_colors.border, contrast_level)
      colors.fg = "#CFE2F3"
    end,
    on_highlights = function(hl, c)
      local nvimtree_bg = adjust_color(base_colors.nvimtree_bg, contrast_level)
      hl.NvimTreeNormal = { bg = nvimtree_bg }
      hl.NvimTreeWinSeparator = { fg = "#7dcfff", bg = nvimtree_bg }
    end,
    cache = false, -- Disable cache to allow dynamic changes
    plugins = {
      all = package.loaded.lazy == nil,
      auto = true,
    },
  })
  vim.cmd("colorscheme tokyonight")
end

-- Increase contrast (darken background)
local function decrease_brightness()
  contrast_level = contrast_level - contrast_step
  apply_tokyonight()
  vim.notify("Background contrast: " .. contrast_level, vim.log.levels.INFO)
end

-- Decrease contrast (lighten background)
local function increase_brightness()
  contrast_level = contrast_level + contrast_step
  apply_tokyonight()
  vim.notify("Background contrast: " .. contrast_level, vim.log.levels.INFO)
end

-- Initial setup
apply_tokyonight()

-- Export functions for use in which-key
return {
  decrease_brightness = decrease_brightness,
  increase_brightness = increase_brightness,
}
