return {
    -- "ellisonleao/gruvbox.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --     vim.o.background = "dark"
    --     vim.cmd([[colorscheme gruvbox]])
    --     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- end
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,

        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    }
}
