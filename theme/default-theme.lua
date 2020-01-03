local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Roboto medium 10'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.deep_orange.hue_500

-- Accent
theme.accent = mat_colors.pink.hue_500

-- Background
theme.background = mat_colors.grey.hue_800

local awesome_overrides =
  function(theme)
  theme.icons = theme_dir .. '/icons/'
  --theme.wallpaper = '#e0e0e0'
  theme.font = 'Roboto medium 10'
  theme.title_font = 'Roboto medium 14'

  theme.fg_normal = '#ffffff'

  theme.fg_focus = '#e4e4e4'
  theme.fg_urgent = '#CC9393'
  theme.bat_fg_critical = '#232323'

  theme.bg_normal = theme.background
  theme.bg_focus = '#5a5a5a'
  theme.bg_urgent = '#3F3F3F'
  theme.bg_systray = theme.background

  -- Borders
  theme.border_width = dpi(3)
  theme.border_normal = theme.background_alt
  theme.border_focus = theme.primary
  theme.border_marked = '#CC9393'

  -- Menu
  theme.menu_height = dpi(16)
  theme.menu_width = dpi(160)

  -- Tooltips
  theme.tooltip_bg = '#232323'
  --theme.tooltip_border_color = '#232323'
  theme.tooltip_border_width = 0
  theme.tooltip_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(6))
  end

  -- Layout
  theme.layout_max = theme.icons .. 'layouts/arrow-expand-all.png'
  theme.layout_tile = theme.icons .. 'layouts/view-quilt.png'

  -- Taglist
  theme.taglist_bg_empty = theme.background
  theme.taglist_bg_occupied = theme.background
  theme.taglist_bg_urgent =
    'linear:0,0:' ..
    dpi(48) ..
      ',0:0,' ..
        theme.accent ..
          ':0.08,' .. theme.accent .. ':0.08,' .. theme.background .. ':1,' .. theme.background
  theme.taglist_bg_focus =
    'linear:0,0:' ..
    dpi(48) ..
      ',0:0,' ..
        theme.primary ..
          ':0.08,' .. theme.primary .. ':0.08,' .. theme.background .. ':1,' .. theme.background

  -- Tasklist
  theme.tasklist_font = 'Roboto medium 11'
  theme.tasklist_bg_normal = theme.background
  theme.tasklist_bg_focus =
    'linear:0,0:0,' ..
    dpi(48) ..
      ':0,' ..
        theme.background ..
          ':0.92,' .. theme.background .. ':0.92,' .. theme.primary .. ':1,' .. theme.primary
  theme.tasklist_bg_urgent = theme.primary
  theme.tasklist_fg_focus = '#DDDDDD'
  theme.tasklist_fg_urgent = theme.fg_normal
  theme.tasklist_fg_normal = '#AAAAAA'

end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
