-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

local act = wezterm.action


-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
  'Hack Nerd Font',
  'Noto Sans Mono',
}
config.warn_about_missing_glyphs=false

config.mouse_bindings = {
  {
    event={Up={streak=1, button="Left"}},
    mods="NONE",
    action=act.CompleteSelectionOrOpenLinkAtMouseCursor("PrimarySelection")
  },
}


-- For example, changing the color scheme:
local one_dark = wezterm.color.get_builtin_schemes()['OneDark (base16)']
one_dark.background = "#1E2127"

config.color_schemes = {
  ['OneDark'] = one_dark,
}

config.color_scheme = 'OneDark'

config.enable_tab_bar = false

config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}


-- and finally, return the configuration to wezterm
return config
