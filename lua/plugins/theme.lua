return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = true,
		term_colors = true,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		styles = {
			comments = { "italic" },
			properties = { "italic" },
			functions = { "bold" },
			keywords = { "italic" },
			operators = { "bold" },
			conditionals = { "bold" },
			loops = { "bold" },
			booleans = { "bold", "italic" },
			numbers = {},
			types = {},
			strings = {},
			variables = {},
		},
		integrations = {
			telescope = true,
			gitsigns = true,
			mason = true,
			treesitter = true,
			neotree = true,
			cmp = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
		},
	},
	custom_highlights = function(colors)
		return {
			CmpBorder = { fg = colors.surface2 },
		}
	end,
	config = function(_, opts)
		require("catppuccin").setup(opts)

		-- setup must be called before loading
		vim.cmd.colorscheme "catppuccin"
	end,
}
