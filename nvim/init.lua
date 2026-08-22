require("plugins")
vim.cmd.colorscheme("catppuccin-nvim")
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		bash = { "shfmt" },
		fish = { "fish_indent" },
		toml = { "taplo" },
		json = { "jq" },
		jsonc = { "jq" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
require("guess-indent").setup()
require("nvim-treesitter").install({ "lua", "python", "rust", "bash", "fish", "toml", "json" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})
require("lualine").setup()
vim.lsp.enable({ "lua_ls", "pyright", "rust_analyzer", "bashls", "fish_lsp" })
require("mini.cmdline").setup()
require("mini.tabline").setup()
require("mini.snippets").setup()
require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.map").setup()
vim.o.cursorline = true
vim.o.number = true
vim.o.termguicolors = true
MiniMap.open()
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
	name = "wl-clipboard",
	copy = {
		["+"] = "wl-copy --foreground --type text/plain",
		["*"] = "wl-copy --foreground --primary --type text/plain",
	},
	paste = {
		["+"] = function()
			return vim.fn.systemlist("wl-paste --no-newline", { "" }, 1)
		end,
		["*"] = function()
			return vim.fn.systemlist("wl-paste --primary --no-newline", { "" }, 1)
		end,
	},
	cache_enabled = true,
}
