-- harpoon 2 setup
return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        require("harpoon"):setup()
    end,
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end, desc = "Mark file"},
        { "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Toggle quick menu"},
        { "<C-1>", function() require("harpoon"):list():select(1) end, desc = "Switch to first file"},
        { "<C-2>", function() require("harpoon"):list():select(2) end, desc = "Switch to second file"},
        { "<C-3>", function() require("harpoon"):list():select(3) end, desc = "Switch to thrid file"},
        { "<C-4>", function() require("harpoon"):list():select(4) end, desc = "Switch to fourth file"},
    }
}

--harpoon 1 setup
--[[ return {
    'ThePrimeagen/harpoon',
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
        { "<leader>a", "<cmd> lua require('harpoon.mark').add_file()<cr>", desc = "Mark file"},
        { "<C-e>", "<cmd> lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle quick menu"},
        { "<C-h>", "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", desc = "Switch to first file"},
        { "<C-t>", "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", desc = "Switch to second file"},
        { "<C-n>", "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", desc = "Switch to thrid file"},
        { "<C-s>", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", desc = "Switch to fourth file"},
    }
} ]]
