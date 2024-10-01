return {
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent_mode = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
		priority = 1000,
		config = function()
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = bg_dark
					colors.bg_float = bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = bg_dark
					colors.bg_statusline = bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})
			vim.cmd([[colorscheme tokyonight]])

			-- Set the background to transparent
			-- local hl_groups = {
			-- 	"Normal",
			-- 	"NormalNC",
			-- 	"NonText",
			-- 	"LineNr",
			-- 	"SignColumn",
			-- 	"VertSplit",
			-- 	"NvimTreeNormal",
			-- 	"NvimCmpNormal",
			-- 	"NvimTreeNormalNC",
			-- 	"TelescopeNormal",
			-- 	"TelescopeBorder",
			-- 	"TelescopePromptNormal",
			-- 	"TelescopePromptBorder",
			-- 	"TelescopeResultsNormal",
			-- 	"TelescopeResultsBorder",
			-- 	"TelescopePreviewNormal",
			-- 	"Pmenu",
			-- 	"PmenuSel",
			-- 	"PmenuSbar",
			-- 	"PmenuThumb",
			-- }
			-- for _, group in ipairs(hl_groups) do
			-- 	vim.api.nvim_set_hl(0, group, { bg = "NONE" })
			-- end

			local hl_groups = vim.api.nvim_get_hl(0, {})
			for group_name, _ in pairs(hl_groups) do
				if
					group_name:match("Normal")
					or group_name:match("Trouble")
					or group_name:match("Telescope")
					or group_name:match("Pmenu")
				then
					vim.api.nvim_set_hl(0, group_name, { bg = "NONE" })
				end
			end
		end,
	},
}
