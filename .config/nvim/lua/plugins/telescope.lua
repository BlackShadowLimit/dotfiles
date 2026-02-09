return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-ui-select.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_cutoff = 1,
                        width = 0.8,
                        height = 0.9,
                    },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-n>"] = actions.move_selection_next,
                            ["<C-p>"] = actions.move_selection_previous,
                        },
                    },
                    file_ignore_patterns = { "node_modules", ".git/" },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    },
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            })

            telescope.load_extension("ui-select")
            telescope.load_extension("fzf")

            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true }

            keymap("n", "<leader>ff", builtin.find_files, opts)
            keymap("n", "<leader>fw", builtin.live_grep, opts)
            keymap("n", "<leader>fa", function()
                builtin.find_files({
                    cwd = vim.fn.expand("~"),
                    hidden = true,
                })
            end, opts)
        end,
    },
}
