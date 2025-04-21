local wezterm = require("wezterm")
local config = wezterm.config_builder()

local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("VictorMono Nerd Font Mono")
config.font_size = 15.0

modal.apply_to_config(config)
bar.apply_to_config(config, {
	position = "top",
	height = 5,
	background_color = "#000000",
	border_color = "#000000",
	border_width = 0,
	modules = {
		tabs = {
			active_tab_fg = 4,
			inactive_tab_fg = 6,
		},
		workspace = {
			enabled = true,
			icon = wezterm.nerdfonts.cod_window,
			color = 8,
		},
		leader = {
			enabled = true,
			icon = wezterm.nerdfonts.oct_rocket,
			color = 2,
		},
		zoom = {
			enabled = false,
			icon = wezterm.nerdfonts.md_fullscreen,
			color = 4,
		},
		pane = {
			enabled = true,
			icon = wezterm.nerdfonts.cod_multiple_windows,
			color = 7,
		},
		username = {
			enabled = false,
			icon = wezterm.nerdfonts.fa_user,
			color = 6,
		},
		hostname = {
			enabled = false,
			icon = wezterm.nerdfonts.cod_server,
			color = 8,
		},
		clock = {
			enabled = false,
			icon = wezterm.nerdfonts.md_calendar_clock,
			format = "%H:%M",
			color = 5,
		},
		cwd = {
			enabled = false,
			icon = wezterm.nerdfonts.oct_file_directory,
			color = 7,
		},
		spotify = {
			enabled = false,
			icon = wezterm.nerdfonts.fa_spotify,
			color = 3,
			max_width = 64,
			throttle = 15,
		},
	},
})

return config
