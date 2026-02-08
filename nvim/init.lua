require("config.lazy")
vim.cmd.colorscheme("catppuccin")
require("mini.cmdline").setup()
require("mini.tabline").setup()
require("mini.snippets").setup()
require("mini.comment").setup()
require("mini.cursorword").setup()
require("oil").setup()
require("modicator").setup()
require("lualine").setup()
require("conform").setup({
	formatters_by_ft = {
		rust = { "rustfmt", lsp_format = "fallback" },
		lua = { "stylua" },
		bash = { "shfmt" },
		fish = { "fish_indent" },
		toml = { "taplo" },
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})
require("nvim-treesitter").install({ "rust", "lua", "bash", "fish", "toml" })
