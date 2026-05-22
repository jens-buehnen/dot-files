require("pack")
vim.cmd.colorscheme("catppuccin")
require("mini.cmdline").setup()
require("mini.tabline").setup()
require("mini.snippets").setup()
require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.map").setup()
require("lualine").setup()
require("conform").setup({
	formatters_by_ft = {
		rust = { "rustfmt", lsp_format = "fallback" },
		lua = { "stylua" },
		bash = { "shfmt" },
		fish = { "fish_indent" },
		toml = { "taplo" },
		json = { "deno_fmt" },
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
})
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
vim.keymap.set("n", "<Leader>mc", MiniMap.close)
vim.keymap.set("n", "<Leader>mf", MiniMap.toggle_focus)
vim.keymap.set("n", "<Leader>mo", MiniMap.open)
vim.keymap.set("n", "<Leader>mr", MiniMap.refresh)
vim.keymap.set("n", "<Leader>ms", MiniMap.toggle_side)
vim.keymap.set("n", "<Leader>mt", MiniMap.toggle)
vim.o.cursorline = true
vim.o.number = true
vim.o.termguicolors = true
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
vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, { desc = "Update all vim.pack plugins" })
MiniMap.open()
