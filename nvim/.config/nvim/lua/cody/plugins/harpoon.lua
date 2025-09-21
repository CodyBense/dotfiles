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
        { "<C-1>", function() require("harpoon"):list():select(1) end, desc = "Switch to first file"},
        { "<C-2>", function() require("harpoon"):list():select(2) end, desc = "Switch to second file"},
        { "<C-3>", function() require("harpoon"):list():select(3) end, desc = "Switch to third file"},
        { "<C-4>", function() require("harpoon"):list():select(4) end, desc = "Switch to fourth file"},
        { "<C-5>", function() require("harpoon"):list():select(5) end, desc = "Switch to fourth file"},
        { "mr", function() require("harpoon"):list():remove() end, desc = "Remove location"},
    }
}
