return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    lazy = false,
    dependencies = {
       "nvim-lua/plenary.nvim",
    },
    config = function()
        require("harpoon"):setup()
    end,
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end, desc = "Mark file"},
        { "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Toggle quick menu"},
        { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Switch to first file"},
        { "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Switch to second file"},
        { "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Switch to third file"},
        { "<C-l>", function() require("harpoon"):list():select(4) end, desc = "Switch to fourth file"},
        { "mr", function() require("harpoon"):list():remove() end, desc = "Remove location"},
    }
}
