return {
	{ "nvim-mini/mini.nvim", version = false },
	dependencies = { "nvim-tree/nvim-web-devicons" },
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
}
