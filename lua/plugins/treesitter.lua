return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		event = "BufReadPost",
		main = "nvim-treesitter", -- tells lazy to call require("nvim-treesitter").setup()
		opts = {
			ensure_installed = {
				"lua_ls",
				"python",
				"bash",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"markdown_inline",
				"vim",
				"vimdoc",
				"query",
				"regex",
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					node_decremental = "<bs>",
				},
			},
		},
	},
}
