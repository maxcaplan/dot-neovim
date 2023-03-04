local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- File formatting
vim.keymap.set("n", "<leader>f", vim.cmd.LspZeroFormat)

local group = vim.api.nvim_create_augroup("AutoFormat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	buffer = bufnr,
	callback = function()
		vim.lsp.buf.format()
	end,
	group = group
})
