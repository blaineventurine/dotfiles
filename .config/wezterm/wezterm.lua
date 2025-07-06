local wezterm = require("wezterm")
local config = wezterm.config_builder()
local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")

require("tabs").setup(config)
require("keymaps").setup(config)

-- local appearance = require("appearance")

config.font = wezterm.font("VictorMono Nerd Font Mono")
config.font_size = 18.0
config.bold_brightens_ansi_colors = true
config.color_scheme_dirs = { wezterm.home_dir }

-- if appearance.is_dark() then
config.color_scheme = "tokyonight_night"
-- else
-- 	config.color_scheme = "Tokyo Night Day"
-- end

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

wezterm.add_to_config_reload_watch_list(config.color_scheme_dirs[1] .. config.color_scheme .. ".toml")
modal.apply_to_config(config)

return config
