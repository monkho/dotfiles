require("core.options")
require("core.keymaps")
require("core.autocmds")

local theme_file = vim.fn.stdpath("config") .. "/lua/core/theme.lua"
if vim.loop.fs_stat(theme_file) then
    pcall(dofile, theme_file)
end

require("plugins")
