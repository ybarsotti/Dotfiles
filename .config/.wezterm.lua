local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Argonaut"
config.font = wezterm.font_with_fallback({
	"MonoLisa",
	"Fira Code",
	"Jetbrains Mono",
})
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
config.background = {
	{
		source = {
			Color = "#282c35",
		},
		width = "100%",
		height = "100%",
		opacity = 0.90,
	},
}
config.window_padding = {
	left = 3,
	right = 3,
	top = 0,
	bottom = 0,
}

return config
