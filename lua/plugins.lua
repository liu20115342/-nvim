local packer = require("packer")
packer.startup({
	function(use)
		-- Packer 管理自己本身
		use("wbthomason/packer.nvim")
		-- 插件了列表..
		-- 三方主题
		-- tokyonight
		use("folke/tokyonight.nvim")
		-- dracula
		use("Mofiqul/dracula.nvim")
		-- OceanicNext
		use("mhartington/oceanic-next")
		-- gruvbox
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		-- nord
		use("shaunsingh/nord.nvim")
		-- onedark
		use("ful1e5/onedark.nvim")
		-- nightfox
		use({
			"EdenEast/nightfox.nvim",
			config = function()
				require("nightfox").setup({
					options = {
						transparent = true,
					},
				})
			end,
		})
		-- zephyrium
		use("titanzero/zephyrium")
		-------------------------------------------------------
		-- nvim-tree
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- bufferline
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		-- lualine
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- telescope extensions
		use("LinArcX/telescope-env.nvim")
		-- dashboard-nvim
		use("glepnir/dashboard-nvim")
		-- project
		use("ahmedkhalf/project.nvim")
		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		-- lspconfig
		use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
		-- 中文文档
		use({ "yianwillis/vimcdoc" })
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")
		use("akinsho/toggleterm.nvim")
		use("onsails/lspkind-nvim")
		use("lukas-reineke/indent-blankline.nvim")
		use("tami5/lspsaga.nvim")
		use("b0o/schemastore.nvim")
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
		use("APZelos/blamer.nvim")
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup({
					signs = {
						add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
						change = {
							hl = "GitSignsChange",
							text = "│",
							numhl = "GitSignsChangeNr",
							linehl = "GitSignsChangeLn",
						},
						delete = {
							hl = "GitSignsDelete",
							text = "_",
							numhl = "GitSignsDeleteNr",
							linehl = "GitSignsDeleteLn",
						},
						topdelete = {
							hl = "GitSignsDelete",
							text = "‾",
							numhl = "GitSignsDeleteNr",
							linehl = "GitSignsDeleteLn",
						},
						changedelete = {
							hl = "GitSignsChange",
							text = "~",
							numhl = "GitSignsChangeNr",
							linehl = "GitSignsChangeLn",
						},
					},
					signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
					numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
					linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
					word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
					watch_gitdir = {
						interval = 1000,
						follow_files = true,
					},
					attach_to_untracked = true,
					current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
					current_line_blame_opts = {
						virt_text = true,
						virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
						delay = 1000,
						ignore_whitespace = false,
					},
					current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
					sign_priority = 6,
					update_debounce = 100,
					status_formatter = nil, -- Use default
					max_file_length = 40000,
					preview_config = {
						-- Options passed to nvim_open_win
						border = "single",
						style = "minimal",
						relative = "cursor",
						row = 0,
						col = 1,
					},
					yadm = {
						enable = false,
					},
				})
			end,
		})
	end,
	config = {
		max_jobs = 16,
		git = {
			default_url_format = "git@github.com:%s",
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
