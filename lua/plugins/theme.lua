return 	{
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
			integrations = {
				telescope = true,
				mason = true,
				treesitter = true,
				cmp = true
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
