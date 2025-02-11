-- look through primeagen to see what i want to change
return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            treesitter.setup({
                highlight = {
                    enable = true,
                },

                indent = { enable = true },
                ensure_installed = {
                    "json",
                    "javascript",
                    "typescript",
                    "html",
                    "css",
                    "lua",
                    "python",
                    "c",
                    "vimdoc",
                    "vim",
                    "rust",
                    "go",
                }
            })
        end
    },
}
