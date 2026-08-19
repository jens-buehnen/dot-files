vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })
vim.pack.add({ "https://github.com/saghen/blink.lib", "https://github.com/saghen/blink.cmp" })
local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup()
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
vim.pack.add({ "https://github.com/NMAC427/guess-indent.nvim" })
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } })
vim.pack.add({ "https://github.com/folke/which-key.nvim" })
vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
