local wezterm = require("wezterm")
local act = wezterm.action
local projects = require("projects")
local M = {}

M.mod = wezterm.target_triple:find("windows") and "SHIFT|CTRL" or "SHIFT|SUPER"
function M.setup(config)
	config.keys = {

		{
			key = "a",
			-- When we're in leader mode _and_ CTRL + A is pressed...
			mods = "LEADER|CTRL",
			-- Actually send CTRL + A key to the terminal
			action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
		},
		{
			key = "p",
			mods = "LEADER",
			action = projects.choose_project(),
		},
		{
			key = "f",
			mods = "LEADER",
			action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
		},
	}
end

return M
