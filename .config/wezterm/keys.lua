local wezterm = require("wezterm")
local M = {}

wezterm.on("update-plugins", function(window, _)
	wezterm.plugin.update_all()
	window:toast_notification("wezterm", "Plugins updated!", nil, 4001)
end)

wezterm.on("toggle-opacity", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 1
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

function M.setup(config)
	config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
	config.disable_default_key_bindings = true
	config.hyperlink_rules = wezterm.default_hyperlink_rules()
	config.mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	}

	-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
	local function is_vim(pane)
		-- this is set by the plugin, and unset on ExitPre in Neovim
		return pane:get_user_vars().IS_NVIM == "true"
	end

	-- if you *ARE* lazy-loading smart-splits.nvim (not recommended)
	-- you have to use this instead, but note that this will not work
	-- in all cases (e.g. over an SSH connection). Also note that
	-- `pane:get_foreground_process_name()` can have high and highly variable
	-- latency, so the other implementation of `is_vim()` will be more
	-- performant as well.
	-- local function is_vim(pane)
	-- 	-- This gsub is equivalent to POSIX basename(3)
	-- 	-- Given "/foo/bar" returns "bar"
	-- 	-- Given "c:\\foo\\bar" returns "bar"
	-- 	local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
	-- 	return process_name == "nvim" or process_name == "vim"
	-- end

	local direction_keys = {
		h = "Left",
		j = "Down",
		k = "Up",
		l = "Right",
	}

	local function split_nav(resize_or_move, key)
		return {
			key = key,
			mods = resize_or_move == "resize" and "META" or "CTRL",
			action = wezterm.action_callback(function(win, pane)
				if is_vim(pane) then
					-- pass the keys through to vim/nvim
					win:perform_action({
						SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
					}, pane)
				else
					if resize_or_move == "resize" then
						win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
					else
						win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
					end
				end
			end),
		}
	end

	local keys = {
		-- Attach to muxer
		{
			key = "a",
			mods = "LEADER",
			action = wezterm.action.AttachDomain("unix"),
		},
		-- Detach from muxer
		{
			key = "d",
			mods = "LEADER",
			action = wezterm.action.DetachDomain({ DomainName = "unix" }),
		},
		-- toggle opacity
		{
			key = "b",
			mods = "LEADER",
			action = wezterm.action.EmitEvent("toggle-opacity"),
		},
		{
			key = "p",
			mods = "LEADER",
			action = wezterm.action.ActivateCommandPalette,
		},
		{
			key = "n",
			mods = "LEADER",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "t",
			mods = "LEADER",
			action = wezterm.action.ShowTabNavigator,
		},
		{
			key = "`",
			mods = "LEADER",
			action = wezterm.action.ShowLauncherArgs({
				flags = "LAUNCH_MENU_ITEMS|FUZZY|TABS|DOMAINS|WORKSPACES",
			}),
		},
		{
			key = ",",
			mods = "LEADER",
			action = wezterm.action.PromptInputLine({
				description = "Enter new name for workspace",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						wezterm.mux.rename_workspace(window:mux_window():get_workspace(), line)
					end
				end),
			}),
		},
		{
			key = [[\]],
			mods = "LEADER",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = [[|]],
			mods = "LEADER",
			action = wezterm.action.SplitPane({
				top_level = true,
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = [[-]],
			mods = "LEADER",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = [[_]],
			mods = "LEADER",
			action = wezterm.action.SplitPane({
				top_level = true,
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "q",
			mods = "LEADER",
			action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		},
		{ key = "u", mods = "LEADER", action = wezterm.action.EmitEvent("update-plugins") },
		{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
		{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
		{ key = "LeftArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "y", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
		{ key = "c", mods = "SUPER", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "SUPER", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "h", mods = "SUPER", action = wezterm.action.HideApplication },
		{ key = "f", mods = "SUPER", action = wezterm.action.Search({ CaseSensitiveString = "" }) },
		{ key = "F12", mods = "", action = wezterm.action.ToggleFullScreen },
		{ key = "[", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "]", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "PageDown", mods = "ALT", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "PageUp", mods = "ALT", action = wezterm.action.MoveTabRelative(1) },
		-- move between split panes
		split_nav("move", "h"),
		split_nav("move", "j"),
		split_nav("move", "k"),
		split_nav("move", "l"),
		-- resize panes
		split_nav("resize", "h"),
		split_nav("resize", "j"),
		split_nav("resize", "k"),
		split_nav("resize", "l"),
	}
end

-- return keys and mouse
return M
