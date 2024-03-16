local wezterm = require("wezterm")
local actions = wezterm.action

return {
	default_prog = { "nu" },
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	font = wezterm.font("JetBrainsMono Nerd Font"),
	default_cwd = "%userprofile%",
	color_scheme = "Gruvbox Material (Gogh)",
	colors = {
		-- Overrides the cell background color when the current cell is occupied by the
		-- cursor and the cursor style is set to Block
		cursor_bg = "#f14c4c",
		-- Overrides the text color when the current cell is occupied by the cursor
		cursor_fg = "black",
		-- Specifies the border color of the cursor when the cursor style is set to Block,
		-- or the color of the vertical or horizontal bar when the cursor style is set to
		-- Bar or Underline.
		cursor_border = "#52ad70",
	},
	window_close_confirmation = "NeverPrompt",
	allow_win32_input_mode = false,
	keys = {
		-- paste from the clipboard
		--{ key = "F", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
		--{ key = "v", mods = "CTRL", action = actions.PasteFrom("Clipboard") },
	},
}
