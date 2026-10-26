local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = true
opt.termguicolors = true
opt.showmode = false -- mode shown in statusline instead
opt.pumheight = 10   -- max items in completion popup

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Files
opt.undofile = true -- persistent undo
opt.swapfile = false
opt.backup = false
opt.updatetime = 250 -- faster CursorHold events
opt.timeoutlen = 400 -- faster which-key popup

-- Clipboard
opt.clipboard = "unnamedplus" -- use system clipboard

-- Folding (nvim-ufo handles this)
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
