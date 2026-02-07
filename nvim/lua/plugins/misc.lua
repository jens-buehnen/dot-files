return {
	{ "nvim-mini/mini.nvim", version = false },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	lazy = false,
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	"stevearc/conform.nvim",
	"folke/trouble.nvim",
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},

	"mawkler/modicator.nvim",
	dependencies = "catppuccin/nvim",
	init = function()
		vim.o.cursorline = true
		vim.o.number = true
		vim.o.termguicolors = true
	end,
	opts = {},
}
