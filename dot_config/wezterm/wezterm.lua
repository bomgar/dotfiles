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
  {
    family = 'Monaspace Neon',
    harfbuzz_features = {'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'calt', 'dlig'},
  },
  { family = 'Noto Sans Mono' },
}

config.font_size=12.0

config.underline_position=-2
config.warn_about_missing_glyphs=false

config.mouse_bindings = {
  {
    event={Up={streak=1, button="Left"}},
    mods="NONE",
    action=act.CompleteSelectionOrOpenLinkAtMouseCursor("PrimarySelection")
  },
}


config.color_scheme = 'catppuccin-mocha'

config.enable_tab_bar = false

config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}


-- and finally, return the configuration to wezterm
return config
