local map = vim.keymap.set

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ── Basics ────────────────────────────────────────────────────
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>W", "<cmd>w<cr>", { desc = "Save all" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit all" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- ── Navigation ────────────────────────────────────────────────
-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Keep cursor centered when jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better window navigation (works with tmux via vim-tmux-navigator)
map("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower pane" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper pane" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })

-- Resize splits with arrows
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- ── Buffers ───────────────────────────────────────────────────
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- ── Editing ───────────────────────────────────────────────────
-- Paste without overwriting register
map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
-- Delete without yanking
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
-- Yank to system clipboard explicitly
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- Indent and stay in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- ── Splits ────────────────────────────────────────────────────
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close split" })

-- ── Terminal ──────────────────────────────────────────────────
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ── Comments (Comment.nvim) ───────────────────────────────────
map("n", "<C-/>", "gcc", { desc = "Toggle line comment", remap = true })
map("v", "<C-/>", "gc", { desc = "Toggle line comment", remap = true })
map("n", "<C-\\>", "gbc", { desc = "Toggle block comment", remap = true })
map("v", "<C-\\>", "gb", { desc = "Toggle block comment", remap = true })
map("n", "<C-_>", "gcc", { desc = "Toggle line comment", remap = true })
map("v", "<C-_>", "gc", { desc = "Toggle line comment", remap = true })

-- ── Colorizer ───────────────────────────────────
map("n", "<leader>ct", "<cmd>ColorizerToggle<cr>", { desc = "Toggle colorizer" })
