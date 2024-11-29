local wezterm = require("wezterm")

local M = {}

function M.setup(config)
	config.font = wezterm.font_with_fallback({
		"MonoLisa",
		"Fira Code",
		"Jetbrains Mono",
	})
	config.adjust_window_size_when_changing_font_size = false
	config.window_frame = {
		font = wezterm.font({ family = "Noto Sans", weight = "Regular" }),
		font_size = 12.0,
	}
end

return M
