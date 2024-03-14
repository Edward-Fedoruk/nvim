local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup('lua/plugins')
local pgns = {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{ 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
	{ 'neovim/nvim-lspconfig' },
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				config = {
					week_header = {
						enable = true, --boolean use a week header
					},
					project = { enable = true, limit = 10 },
					mru = { enable = false, limit = 5 },
					footer = {},
					packages = { enable = false },
					shortcut = {
						{ desc = 'Update Plugins', group = 'DashboardShortCut', action = 'Lazy update', key = 'u' },
					},
					preview = {
						command = '',
						file_path = nil,
						file_height = 3,
						file_width = 3,
					},

				}, -- config,
				disable_move = true
			}
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	},
	{ 'hrsh7th/cmp-nvim-lsp' },
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require('cmp')
			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				}
			})
		end

	},
	{ 'L3MON4D3/LuaSnip' },
	{
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup({
				ui = {
					border = 'single'
				}
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls" },
			}
			local lsp_zero2 = require('lsp-zero')
			require('lspconfig').lua_ls.setup({
				on_attach = function(client, bufnr)
					lsp_zero2.default_keymaps({ buffer = bufnr })
					lsp_zero2.async_autoformat(client, bufnr)
				end

			})
		end
	},
	{
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
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "lua", "vimdoc", "javascript", "typescript", "html" },
				sync_install = false,
				highlight = { enable = true },
			})
		end
	}
}

local dashboardColor = '#f5e0dc'
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = '#f2cdcd' })
vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = dashboardColor, })
vim.api.nvim_set_hl(0, "DashboardProjectTitleIcon", { fg = dashboardColor, })
vim.api.nvim_set_hl(0, "DashboardProjectIcon", { fg = dashboardColor, })
vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = dashboardColor, })
vim.api.nvim_set_hl(0, "DashboardMruIcon", { fg = dashboardColor, })
vim.api.nvim_set_hl(0, "DashboardFiles", { fg = '#cdd6f4', })
vim.api.nvim_set_hl(0, "DashboardShortCutIcon", { fg = dashboardColor, })
