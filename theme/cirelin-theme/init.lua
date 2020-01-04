local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Roboto medium 10'

theme.icon_theme = 'Papirus-Dark'
theme.systray_icon_spacing = 0
theme.wallpaper = theme_dir .. '/wallpapers/1920x1080.svg'

-- Colors Pallets

-- Primary
theme.primary = '#7094b9'

-- Background
theme.background = '#192933'
theme.background_alt = '#121e25'

local awesome_overrides = function(theme)
  --
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
