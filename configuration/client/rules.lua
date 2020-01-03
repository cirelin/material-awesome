local awful = require('awful')
local gears = require('gears')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

-- Rules
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_offscreen,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = false
    }
  },
  {
    -- For those programs that don't play nice in tiled mode
    rule_any = {class = {'lxterminal', 'discord'}},
    properties = {size_hints_honor = false}
  },
  {
    rule_any = {name = {'QuakeTerminal'}},
    properties = {skip_decoration = true}
  },
  -- Titlebars
  {
    rule_any = {type = {'dialog'}, class = {'Wicd-client.py', 'calendar.google.com'}},
    properties = {
      placement = awful.placement.centered,
      ontop = true,
      floating = true,
      drawBackdrop = true,
      shape = function()
        return function(cr, w, h)
          gears.shape.rounded_rect(cr, w, h, 8)
        end
      end,
      skip_decoration = true
    }
  },
  -- Force programs to be in certain tags
  {
    rule_any = {instance = {'Opera'}},
    properties = {tag = '1'}
  },
  {
    rule_any = {instance = {'nemo'}},
    properties = {tag = '3'}
  },
  {
    rule_any = {instance = {'discord', 'mailspring'}},
    properties = {tag = '4'}
  },
  {
    rule_any = {instance = {'Steam'}},
    properties = {tag = '5'}
  },
  {
    rule_any = {instance = {'[Ss]potify'}},
    properties = {tag = '6'}
  }
}
