-- Line number settings
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

-- Undo buffer settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scroll settings
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
