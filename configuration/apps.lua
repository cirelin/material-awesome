local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'lxterminal',
    sysmonitor = 'stacer',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = '',
    screenshot = '~/.config/awesome/configuration/utils/screenshot',
    region_screenshot = 'flameshot gui',
    delayed_screenshot = '~/.config/awesome/configuration/utils/screenshot -d 10',
    
    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = 'vivaldi',
    editor = 'code',
    text = 'mousepad', -- GUI text editor
    social = 'mailspring',
    game = 'steam',
    files = 'nemo',
    music = 'spotify',
    other = rofi_command
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'nm-applet --indicator', -- Wifi
    --'blueman-applet', -- Bluetooth
    'ibus-daemon --xim', -- Ibus daemon for keyboard
    --'numlockx on', -- Enable numlock
    '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    -- KDE  '/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    -- MATE '/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'flameshot', -- Area select screenshot tool
    'steam -silent', -- Start steam in background
    'discord --start-minimized', -- Start discord in background
    'mailspring --background', -- Email client
    'xfce4-power-manager', -- Power manager

    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
