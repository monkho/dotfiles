return {
    -- ── Colorscheme — default + extras ────────────────────────
    { "folke/tokyonight.nvim",  lazy = false },
    { "EdenEast/nightfox.nvim", lazy = false },
    { "rose-pine/neovim",       name = "rose-pine", lazy = false },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            require("kanagawa").setup({})
        end,
    },
    { "sainnhe/everforest",             lazy = false },
    { "projekt0n/github-nvim-theme",    lazy = false },
    -- { "nyoom-engineering/oxocarbon.nvim", lazy = false },
    { "craftzdog/solarized-osaka.nvim", lazy = false },
    { "scottmckendry/cyberdream.nvim",  lazy = false },
    { "maxmx03/dracula.nvim",           lazy = false },

    -- ── Theme switcher ────────────────────────────────────────
    {
        "zaldih/themery.nvim",
        lazy   = false,
        cmd    = "Themery",
        keys   = {
            { "<leader>tt", "<cmd>Themery<cr>", desc = "Theme switcher" },
        },
        config = function()
            require("themery").setup({
                livePreview = true,
                themes      = {
                    -- Catppuccin
                    "catppuccin-mocha",
                    "catppuccin-macchiato",
                    "catppuccin-frappe",
                    "catppuccin-latte",
                    -- Tokyo Night
                    "tokyonight",
                    "tokyonight-storm",
                    "tokyonight-moon",
                    "tokyonight-day",
                    -- Nightfox
                    "nightfox",
                    "nordfox",
                    "carbonfox",
                    "dawnfox",
                    "dayfox",
                    "duskfox",
                    "terafox",
                    -- Rose Pine
                    "rose-pine",
                    "rose-pine-moon",
                    "rose-pine-dawn",
                    -- Kanagawa
                    "kanagawa-wave",
                    "kanagawa-dragon",
                    "kanagawa-lotus",
                    -- Everforest
                    "everforest",
                    -- New ones
                    "github_dark",
                    "github_dark_dimmed",
                    "github_dark_high_contrast",
                    "github_light",
                    -- "oxocarbon",
                    "solarized-osaka",
                    "solarized-osaka-storm",
                    "cyberdream",
                    "dracula",
                },
            })
        end,
    },

    -- ── Statusline ────────────────────────────────────────────
    {
        "nvim-lualine/lualine.nvim",
        lazy         = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config       = function()
            local mode_colors = {
                n = "#89b4fa",
                i = "#a6e3a1",
                v = "#cba6f7",
                V = "#cba6f7",
                c = "#f9e2af",
                R = "#f38ba8",
                t = "#94e2d5",
                ["\22"] = "#cba6f7",
            }
            local function mode_color()
                return { fg = "#1e1e2e", bg = mode_colors[vim.fn.mode()] or "#89b4fa" }
            end

            require("lualine").setup({
                options = {
                    theme                = "auto",
                    globalstatus         = true,
                    component_separators = { left = "", right = "" },
                    section_separators   = { left = "", right = "" },
                    disabled_filetypes   = { statusline = { "dashboard", "NvimTree" } },
                },
                sections = {
                    lualine_a = { {
                        "mode",
                        color = mode_color,
                        separator = { left = "", right = "" },
                    } },
                    lualine_b = {
                        { "branch", icon = "" },
                        { "diff",   symbols = { added = " ", modified = " ", removed = " " } },
                    },
                    lualine_c = { {
                        "filename",
                        path = 1,
                        symbols = { modified = "  ", readonly = "  " },
                    } },
                    lualine_x = {
                        {
                            "diagnostics",
                            sources = { "nvim_lsp" },
                            symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
                        },
                        { "filetype" },
                    },
                    lualine_y = { "progress" },
                    lualine_z = { {
                        "location",
                        separator = { left = "", right = "" },
                    } },
                },
            })
        end,
    },

    -- ── Dashboard ─────────────────────────────────────────────
    {
        "nvimdev/dashboard-nvim",
        lazy         = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config       = function()
            require("dashboard").setup({
                theme = "doom",
                config = {
                    header = {
                        "",
                        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ",
                        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ",
                        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ",
                        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
                        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
                        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
                        "",
                        "         WSL · Kali · Zsh · Tmux · Neovim              ",
                        "",
                    },
                    center = {
                        { icon = "  ", desc = "Find File      ", key = "f", action = "Telescope find_files" },
                        { icon = "  ", desc = "Recent Files   ", key = "r", action = "Telescope oldfiles" },
                        { icon = "  ", desc = "Live Grep      ", key = "g", action = "Telescope live_grep" },
                        { icon = "  ", desc = "New File       ", key = "n", action = "enew" },
                        { icon = "  ", desc = "Config         ", key = "c", action = "edit " .. vim.fn.stdpath("config") },
                        { icon = "󰒓  ", desc = "Theme Switcher ", key = "t", action = "Themery" },
                        { icon = "  ", desc = "Quit           ", key = "q", action = "qa" },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        return { "", "󰂖  " .. stats.count .. " plugins loaded" }
                    end,
                },
            })

            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    local argc = vim.fn.argc()
                    if argc == 0 then
                        -- No args: dashboard opens, tree opens beside it
                        vim.schedule(function()
                            require("nvim-tree.api").tree.open()
                            vim.cmd("wincmd p")
                        end)
                    elseif argc == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
                        -- Directory arg (nvim .): skip dashboard, open tree directly
                        vim.schedule(function()
                            require("nvim-tree.api").tree.open()
                            -- Close the empty buffer nvim creates for the directory
                            local buf = vim.api.nvim_get_current_buf()
                            if vim.bo[buf].filetype == "" then
                                vim.cmd("bdelete " .. buf)
                            end
                        end)
                    end
                end,
            })
        end,
    },

    -- ── File tree ─────────────────────────────────────────────
    {
        "nvim-tree/nvim-tree.lua",
        lazy         = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys         = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
            { "<leader>o", "<cmd>NvimTreeFocus<cr>",  desc = "Focus file tree" },
        },
        config       = function()
            vim.g.loaded_netrw       = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({
                view        = { width = 30 },
                renderer    = {
                    group_empty   = true,
                    highlight_git = true,
                    icons         = { show = { git = true, file = true, folder = true } },
                },
                filters     = { dotfiles = false },
                git         = { enable = true, ignore = false },
                diagnostics = {
                    enable       = true,
                    show_on_dirs = true,
                    icons        = { error = " ", warning = " ", hint = "󰠠 ", info = " " },
                },
                actions     = {
                    open_file = { quit_on_open = false, window_picker = { enable = true } },
                },
            })
        end,
    },

    -- ── Telescope ─────────────────────────────────────────────
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>",               desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",                desc = "Live grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",                  desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",                desc = "Help" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                 desc = "Recent files" },
            { "<leader>fc", "<cmd>Telescope grep_string<cr>",              desc = "Find word under cursor" },
            { "<leader>fd", "<cmd>Telescope diagnostics<cr>",              desc = "Diagnostics" },
            { "<leader>ft", "<cmd>Telescope colorscheme preview=true<cr>", desc = "Colorschemes" },
        },
        config = function()
            local telescope = require("telescope")
            local actions   = require("telescope.actions")

            local dropdown  = require("telescope.themes").get_dropdown({
                previewer       = false,
                prompt_prefix   = "   ",
                selection_caret = "  ",
                layout_config   = { width = 0.5, height = 0.4 },
                borderchars     = {
                    prompt  = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                    results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
                    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                },
            })

            local ivy       = require("telescope.themes").get_ivy({
                prompt_prefix   = "   ",
                selection_caret = "  ",
                layout_config   = { height = 0.4 },
            })

            telescope.setup({
                defaults = {
                    prompt_prefix    = "   ",
                    selection_caret  = "  ",
                    entry_prefix     = "  ",
                    sorting_strategy = "ascending",
                    layout_config    = { horizontal = { preview_width = 0.55 } },
                    mappings         = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_to_qflist,
                            ["<Esc>"] = actions.close,
                        },
                    },
                },
                pickers = {
                    find_files  = dropdown,
                    buffers     = dropdown,
                    oldfiles    = dropdown,
                    help_tags   = dropdown,
                    colorscheme = dropdown,
                    live_grep   = ivy,
                    grep_string = ivy,
                    diagnostics = ivy,
                },
            })
            telescope.load_extension("fzf")
        end,
    },

    -- ── Which-key ─────────────────────────────────────────────
    {
        "folke/which-key.nvim",
        lazy   = false,
        config = function()
            local wk = require("which-key")
            wk.setup({
                preset = "modern",
                win    = { border = "rounded" },
                icons  = { separator = "  " },
            })
            wk.add({
                { "<leader>f", group = "  Find" },
                { "<leader>g", group = "  Git" },
                { "<leader>l", group = "󰒓  LSP" },
                { "<leader>s", group = "  Splits" },
                { "<leader>t", group = "  Themes" },
                { "<leader>b", group = "  Buffers" },
                { "<leader>c", group = "  Colorschemes" },
            })
        end,
    },

    -- ── Bufferline ────────────────────────────────────────────
    {
        "akinsho/bufferline.nvim",
        lazy         = false,
        dependencies = "nvim-tree/nvim-web-devicons",
        config       = function()
            local bufferline = require("bufferline")
            bufferline.setup({
                options = {
                    hover                   = {
                        enabled = true,
                        delay   = 150,
                        reveal  = { 'close' }
                    },
                    mode                    = "buffers",
                    diagnostics             = "nvim_lsp",
                    separator_style         = "slant",
                    show_close_icon         = false,
                    show_buffer_close_icons = false,
                    offsets                 = { {
                        filetype  = "NvimTree",
                        text      = "  Files",
                        highlight = "Directory",
                        padding   = 1,
                    } },
                    diagnostics_indicator   = function(_, _, diag)
                        local s = ""
                        if diag.error then s = s .. " " .. diag.error end
                        if diag.warning then s = s .. " " .. diag.warning end
                        return s
                    end,
                    style_preset            = {
                        bufferline.style_preset.no_italic
                    }
                },
            })
        end,
    },

    -- ── Indent scope ──────────────────────────────────────────
    {
        "lukas-reineke/indent-blankline.nvim",
        main   = "ibl",
        event  = "BufReadPost",
        config = function()
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "IblScope", { fg = "#cba6f7" })
            end)
            require("ibl").setup({
                indent = { char = "│" },
                scope  = { enabled = true, highlight = "IblScope", show_start = true, show_end = false },
            })
        end,
    },

    -- ── Rounded borders ───────────────────────────────────────
    {
        "stevearc/dressing.nvim",
        lazy   = false,
        config = function()
            require("dressing").setup({
                input  = { border = "rounded", win_options = { winblend = 0 } },
                select = { backend = { "telescope", "builtin" }, builtin = { border = "rounded" } },
            })
        end,
    },

    -- ── Cheatsheet ────────────────────────────────────────────
    {
        "nvim-telescope/telescope.nvim", -- already installed, just adding a custom picker
        keys = {
            { "<leader>?", desc = "Cheatsheet<cr>" },
        },
        config = function()
            -- Custom cheatsheet command that reads your .cheat file
            vim.api.nvim_create_user_command("Cheatsheet", function()
                local cheat_file = vim.fn.stdpath("config") .. "/cheatsheets/personal/nvim.cheat"

                if vim.fn.filereadable(cheat_file) == 0 then
                    vim.notify("Cheatsheet file not found: " .. cheat_file, vim.log.levels.ERROR)
                    return
                end

                -- Parse the .cheat file into entries
                local entries = {}
                local section = ""
                for line in io.lines(cheat_file) do
                    if line:match("^##") then
                        section = line:gsub("^##%s*", "")
                    elseif line:match("|") then
                        local key, desc = line:match("^%s*(.-)%s*|%s*(.-)%s*$")
                        if key and desc and key ~= "" then
                            table.insert(entries, {
                                display = string.format("%-28s │ %-30s │ %s", key, desc, section),
                                key     = key,
                                desc    = desc,
                                section = section,
                            })
                        end
                    end
                end

                -- Display in Telescope
                local pickers       = require("telescope.pickers")
                local finders       = require("telescope.finders")
                local conf          = require("telescope.config").values
                local actions       = require("telescope.actions")
                local entry_display = require("telescope.pickers.entry_display")

                local displayer     = entry_display.create({
                    separator = "  ",
                    items = {
                        { width = 26 },
                        { width = 32 },
                        { remaining = true },
                    },
                })

                pickers.new(require("telescope.themes").get_ivy({
                    prompt_title    = "  Cheatsheet",
                    layout_config   = { height = 0.5 },
                    prompt_prefix   = "   ",
                    selection_caret = "  ",
                }), {
                    finder          = finders.new_table({
                        results = entries,
                        entry_maker = function(entry)
                            return {
                                value   = entry,
                                display = function()
                                    return displayer({
                                        { entry.key,     "TelescopeResultsIdentifier" },
                                        { entry.desc,    "TelescopeResultsNormal" },
                                        { entry.section, "TelescopeResultsComment" },
                                    })
                                end,
                                ordinal = entry.key .. " " .. entry.desc .. " " .. entry.section,
                            }
                        end,
                    }),
                    sorter          = conf.generic_sorter({}),
                    attach_mappings = function(_, map)
                        -- Enter just closes, the cheatsheet is reference-only
                        map("i", "<CR>", actions.close)
                        map("n", "<CR>", actions.close)
                        return true
                    end,
                }):find()
            end, {})

            -- Bind the keymap
            vim.keymap.set("n", "<leader>?", "<cmd>Cheatsheet<cr>", { desc = "Cheatsheet" })
        end,
    },
}
