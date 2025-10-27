return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            treesitter.setup({
                highlight = { enable = true, },

                indent = { enable = true },
                ensure_installed = {
                    "json",
                    "lua",
                    "python",
                    "c",
                    "vimdoc",
                    "vim",
                    "rust",
                    "go",
                    "markdown",
                    "markdown_inline",
                }
            })
        end
    },
}
