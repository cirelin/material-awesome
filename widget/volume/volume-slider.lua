local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local mat_slider = require('widget.material.slider')
local mat_icon_button = require('widget.material.icon-button')
local icons = require('theme.icons')
local watch = require('awful.widget.watch')
local spawn = require('awful.spawn')
local muted = false

function toggle_mute()
  spawn('amixer -D pulse set Master 1+ toggle')
end

function set_volume(value)
  spawn('amixer -D pulse sset Master ' .. value .. '%')
end

local slider =
  wibox.widget {
  read_only = false,
  widget = mat_slider
}

slider:connect_signal(
  'property::value',
  function()
    if not muted then
      set_volume(slider.value)
    end
  end
)

watch(
  [[bash -c "amixer -D pulse sget Master"]],
  0.1,
  function(_, stdout)
    local mute = string.match(stdout, '%[(o%D%D?)%]')
    local volume = string.match(stdout, '(%d?%d?%d)%%')
    if mute == 'on' then
      muted = false
      slider:set_value(tonumber(volume))
    else
      muted = true
      slider:set_value(0)
    end
    collectgarbage('collect')
  end
)

local icon =
  wibox.widget {
  image = icons.volume,
  widget = wibox.widget.imagebox
}

local button = mat_icon_button(icon)

button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        toggle_mute()
      end
    )
  )
)

local volume_setting =
  wibox.widget {
  button,
  slider,
  widget = mat_list_item
}

return volume_setting
