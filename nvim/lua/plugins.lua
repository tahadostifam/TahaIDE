return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = false,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = { bold = true },
                variables = {},
            },
            on_colors = function(colors)
                colors.bg = "#000000"
            end,
            on_highlights = function(hl, c)
                hl.CursorLine = { bg = "#6b6a6a", bold = true }
                hl.CursorLineNr = { fg = "#29bd04", bold = true }
                hl.LineNr = { fg = "#6b6a6a" }
                hl.Visual = { bg = "#404040" }
            end,
        })
        vim.cmd("colorscheme tokyonight")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "16color",
            },
            sections = {
                lualine_a = {
                    { "mode", color = { fg = "#000000", bg = "#29bd04" } },
                },
                lualine_b = { "branch" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30,
                    side = "left",
                },
                renderer = {
                highlight_opened_files = "all",
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                    },
                },
                },
                filters = {
                dotfiles = false,
                },
            })
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        end,
    },
}