require("config.lazy")
vim.cmd.colorscheme("catppuccin")
require("mini.snippets").setup()
require("mini.cmdline").setup()
require("mini.tabline").setup()
require("lualine").setup()
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
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
