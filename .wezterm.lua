-- WezTerm Configuration
local wezterm = require 'wezterm'
local config = {}

-- Use config builder for clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font configuration with Nerd Font icons
config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Medium' })
config.font_size = 14.0

-- Color scheme (Tokyo Night)
config.color_scheme = 'Tokyo Night'

-- Window configuration
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

-- Performance tweaks for low memory
config.max_fps = 60
config.animation_fps = 30
config.cursor_blink_rate = 500

-- Scrollback
config.scrollback_lines = 10000

-- Key bindings
config.keys = {
  -- Pane splitting (similar to tmux)
  { key = '|', mods = 'CMD|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '_', mods = 'CMD|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

  -- Pane navigation
  { key = 'h', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Right' },

  -- Close pane
  { key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentPane { confirm = true } },
}

-- Padding
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Disable audible bell
config.audible_bell = 'Disabled'

return config
