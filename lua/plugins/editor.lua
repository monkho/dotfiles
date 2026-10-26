return {
    -- Fuzzy finder — the most important plugin
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Recent files" },
            { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find word under cursor" },
            { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = { preview_width = 0.55 },
                    mappings = {
                        i = {
                            ["<C-k>"] = require("telescope.actions").move_selection_previous,
                            ["<C-j>"] = require("telescope.actions").move_selection_next,
                            ["<C-q>"] = require("telescope.actions").send_to_qflist,
                        },
                    },
                },
            })
            telescope.load_extension("fzf")
        end,
    },

    -- Tmux + Nvim seamless navigation
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- Surround — cs"' to change " to ', ysiw" to wrap word, ds" to delete
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = true,
    },

    -- Comment — gcc to toggle line, gc in visual
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = true,
    },

    -- Git signs in the gutter
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        keys = {
            { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
            { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",   desc = "Reset hunk" },
            { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",   desc = "Stage hunk" },
            { "<leader>gb", "<cmd>Gitsigns blame_line<cr>",   desc = "Blame line" },
            { "]g",         "<cmd>Gitsigns next_hunk<cr>",    desc = "Next hunk" },
            { "[g",         "<cmd>Gitsigns prev_hunk<cr>",    desc = "Prev hunk" },
        },
        config = true,
    },

    -- Flash — fast navigation with s and S
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash jump" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
        },
    },

    -- Better quickfix
    { "kevinhwang91/nvim-bqf", ft = "qf" },

    -- Colorizer - show hex codes
    "catgoose/nvim-colorizer.lua",
    --event = "BufReadPost",
    lazy = false,
    config = function()
        require("colorizer").setup({
            filetypes = { "*" },
            user_default_options = {
                RGB      = true,
                RRGGBB   = true,          -- #RRGGBB
                names    = false,         -- "Blue" etc — keep off, too noisy
                RRGGBBAA = true,          -- #RRGGBBAA
                rgb_fn   = true,          -- rgb() and rgba()
                hsl_fn   = true,          -- hsl() and hsla()
                mode     = "virtualtext", -- show color AS the background of the hex value
            }
        })
    end,
}
