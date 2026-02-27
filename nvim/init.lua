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

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
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
