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
                    colors.bg       = "#000000"
                    colors.terminal = {
                        black          = "#000000",
                        black_bright   = "#5B5D64",
                        blue           = "#0554FF",
                        blue_bright    = "#2063FF",
                        cyan           = "#02A2FF",
                        cyan_bright    = "#60BFFF",
                        green          = "#5FB801",
                        green_bright   = "#B2FD48",
                        magenta        = "#6512FF",
                        magenta_bright = "#8746FF",
                        red            = "#E7002A",
                        red_bright     = "#DF556C",
                        white          = "#ECF0FF",
                        white_bright   = "#FFFFFF",
                        yellow         = "#FF9900",
                        yellow_bright  = "#FFBA43",
                    }
                    colors.todo     = "#1660FF"
                    colors.blue     = "#0554FF"
                    colors.blue0    = "#3D59A1"
                    colors.blue1    = "#2AC3DE"
                    colors.blue2    = "#0DB9D7"
                    colors.blue5    = "#89DDFF"
                    colors.blue6    = "#B4F9F8"
                    colors.blue7    = "#394B70"
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
                theme = "tokyonight",
                globalstatus = true
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
                    width = 25,
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
                actions = {
                    open_file = {
                        quit_on_open = false
                    }
                }
            })

            vim.keymap.set("n", "<C-S-e>", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        end,
    }
}
