return {
	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd([[colorscheme tokyonight-storm]])
	-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
	-- end,
	-- opts = {},
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.o.background = "dark"
        vim.cmd([[colorscheme gruvbox]])
        vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
    end
}
