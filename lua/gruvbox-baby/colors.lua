local util = require("gruvbox-baby.util")

local M = {}

local the_palette = {
  dark0 = "#0d0e0f",
  dark = "#202020",
  foreground = "#d4be98",
  background = "#282828",
  background_dark = "#1d2021",
  background_light = "#32302f",
  medium_gray = "#504945",
  comment = "#665c54",
  gray = "#3c3836",
  soft_yellow = "#d8a657",
  bright_yellow = "#d8a657",
  orange = "#e78a4e",
  red = "#ea6962",
  error_red = "#ea6962",
  magenta = "#d3869b",
  pink = "#d3869b",
  light_blue = "#7daea3",
  dark_gray = "#6f8352",
  blue_gray = "#7daea3",
  soft_green = "#89b482",
  forest_green = "#6c782e",
  clean_green = "#a9b665",
  milk = "#a89984",
  none = "NONE",
}

the_palette.term = {
  "#282828", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#a9b665", "#d4be98",
  "#928374", "#ae5858", "#6c782e", "#d8a657", "#45707a", "#945e80", "#6f8352", "#a89984",
}

-- these are backgrounds
the_palette.diff = {
  add = "#6f8352",
  change = "#45707a",
  delete = "#ae5858",
  text = "#AE8358",
}
M.p = the_palette

local original_palette = vim.tbl_extend("force", the_palette, {
  foreground = "#d4be98",
  soft_green = "#a9b665",
  forest_green = "#a9b665",
  soft_yellow = "#fabd2f",
  light_blue = "#d8a657",
  magenta = "#d3869b",
  orange = "#e78a4e",
  gray = "#3c3836",
  comment = "#3c3836",
})

function M.config(config)
  config = config or require("gruvbox-baby.config")
  local colors
  if config.use_original_palette then
    colors = original_palette
  else
    colors = the_palette
  end

  local intensity_map = {
    ["dark"] = {
      dark = colors.dark0,
      background = colors.background_dark,
      background_dark = util.darken(colors.background_dark, 0.8),
    },
    ["medium"] = {
      background = colors.background,
      background_dark = util.darken(colors.background, 0.9),
    },
    ["soft"] = {
      background = colors.background_light,
      background_dark = util.darken(colors.background_light, 0.8),
      background_light = util.lighten(colors.background_light, 0.95),
    },
    ["soft_flat"] = {
      background = colors.background_light,
      background_dark = colors.background_light,
      background_light = util.lighten(colors.background_light, 0.95),
    },
  }

  local background = config.background_color or colors.background
  if intensity_map[background] then
    colors = vim.tbl_extend("force", colors, intensity_map[background])
  end

  if config.transparent_mode then
    local transparent = {
      background = colors.none,
      background_dark = colors.none,
    }
    colors = vim.tbl_extend("force", colors, transparent)
  end

  if config.color_overrides then
    for override_color, new_color in pairs(config.color_overrides) do
      colors[override_color] = new_color
    end
  end
  return colors
end

return M
