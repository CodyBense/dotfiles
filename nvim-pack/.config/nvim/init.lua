-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.swapfile = false
vim.opt.winborder = "rounded"
vim.opt.undofile = true
vim.opt.conceallevel = 1
vim.g.mapleader = " "

-- Run :=vim.pack.del({'plugin'}) to remove plugin
vim.pack.add({
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/mbbill/undotree" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter",          version = "master" },
    { src = "https://github.com/tree-sitter-grammars/tree-sitter-markdown" },
    { src = "https://github.com/folke/trouble.nvim" },
    { src = "https://github.com/ThePrimeagen/harpoon",                     version = "harpoon2" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/NvChad/nvim-colorizer.lua" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/Saghen/blink.cmp",                         version = "v1.7.0" },
    { src = "https://github.com/epwalsh/obsidian.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim",            version = "0.1.8" },
    { src = "https://github.com/chipsenkbeil/org-roam.nvim", },
    { src = "https://github.com/nvim-orgmode/orgmode", },
})

-- Plygin settings
vim.cmd("colorscheme catppuccin-mocha")
require("oil").setup()
require("mini.pick").setup()
require("trouble").setup()
require("mini.icons").setup()
require("harpoon").setup()
require("colorizer").setup()
require("mini.surround").setup()
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "arduino_language_server",
        "clangd",
        "bashls",
        "gopls",
        "lua_ls",
        "pylsp",
        "rust_analyzer",
        "gopls"
    },
})
require("org-roam").setup({
    directory = "/home/codybense/OrgRoamFiles",
    org_files = {
        -- other directories or files
        "/home/codybense/OrgRoamFiles/Notes",
    }
})
require("orgmode").setup({
    org_agenda_files = "/home/codybense/OrgRoamFiles/agenda.org",
    org_default_notes_file = "/home/codybense/OrgRoamFiles/Notes/default.org",
    -- org_agenda_files = "/home/codybense/Documents/orgfiles/**/*",
    -- org_default_notes_file = "/home/codybense/Documents/Notes/default.org",
})
require("render-markdown").setup({
    enabled = true,
    render_modes = { 'n', 'c', 't' },
    file_types = { 'markdown' },
    nested = true,
    restart_highlighter = true,
})
require("nvim-treesitter.configs").setup({
    modules = {
    },
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
    },
    sync_install = true,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
})

require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
    signature = { enabled = true },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        menu = {
            auto_show = true,
            draw = {
                treesitter = { "lsp" },
                columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
            },
        },
    },
})

require("obsidian").setup({
    workspaces = {
        {
            name = "notes",
            path = "~/Documents/Obsidian/notes/",
        },
        {
            name = "projects",
            path = "~/Documents/Obsidian/projects/",
        },
        {
            name = "daily",
            path = "~/Documents/Obsidian/daily/",
        },
        {
            name = "book_view",
            path = "~/Documents/Obsidian/book_view/",
        },
    },

    log_level = vim.log.levels.INFO,

    daily_notes = {
        date_format = "%m-%d-%Y",
        alias_format = "%m-%d-%Y",
        default_tags = { "daily-notes" },
        template = nil,
    },

    completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
        create_new = false,
    },
})

require("telescope").setup({
    defaults = {
        preview = { treesitter = false },
        color_devicons = true,
        sorting_strategy = "ascending",
        borderchars = {
            "─", -- top
            "│", -- right
            "─", -- bottom
            "│", -- left
            "┌", -- top-left
            "┐", -- top-right
            "┘", -- bottom-right
            "└", -- bottom-left
        },
        path_displays = { "smart" },
        layout_config = {
            height = 100,
            width = 400,
            prompt_position = "top",
            preview_cutoff = 40,
        }
    }
})

-- Keymaps
local map = vim.keymap.set
-- allows moving of selected lines and autoindent
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- add next line at end and keeps cursor in current position
map("n", "J", "mzJ`z")
-- half page jumps and keeys cursor in middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- keeps cursor in place when searching terms
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- copys to computer clipboard
map({ "n", "v" }, "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
-- pastes from computer clipboard
map({ "n", "v" }, "<leader>p", "\"+p")
map("n", "<leader>P", "\"+P")
-- copys over and puts replace in void register
map("x", "<leader>P", "\"_dP")
-- deletes to void register
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")
-- Q is a bad place?
map("n", "Q", "<nop>")
-- Source file
map("n", "<leader><leader>x", "<cmd>source %<CR>")
-- lsp format
map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<leader>gd", vim.lsp.buf.definition)
map("n", "<leader>gD", vim.lsp.buf.declaration)
-- Oil
map("n", "<leader>pv", "<CMD>Oil<CR>")
-- Telescope
local builtin = require('telescope.builtin')
map("n", "<leader>f", builtin.find_files)
map("n", "<leader>s", builtin.live_grep)
map("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
map("n", "<leader>gf", builtin.git_files)
-- map("n", "<leader>gs", ":Pick grep_live tool='git'<CR>")
map("n", "<leader>h", builtin.help_tags)
-- Mini.pick
-- map("n", "<leader>f", ":Pick files<CR>")
-- map("n", "<leader>s", ":Pick grep_live<CR>")
-- map("n", "<leader>gf", ":Pick files tool='git'<CR>")
map("n", "<leader>gs", ":Pick grep_live tool='git'<CR>")
-- map("n", "<leader>h", ":Pick help<CR>")
-- Undotree
map("n", "<leader>u", function()
    vim.cmd.UndotreeToggle()
    vim.cmd.UndotreeFocus()
end)
-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>")
-- Harpoon
map("n", "<C-e>", function()
    local harpoon = require("harpoon")
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)
map("n", "<leader>a", function() require("harpoon"):list():add() end)
map("n", "<C-h>", function() require("harpoon"):list():select(1) end)
map("n", "<C-j>", function() require("harpoon"):list():select(2) end)
map("n", "<C-k>", function() require("harpoon"):list():select(3) end)
map("n", "<C-l>", function() require("harpoon"):list():select(4) end)
map("n", "<C-;>", function() require("harpoon"):list():select(5) end)
map("n", "<leader>mr", function() require("harpoon"):list():remove() end)

-- vim.pack stuff
map("n", "<leader>pc", function()
    local active_plugins = {}
    local unused_plugins = {}

    for _, plugin in ipairs(vim.pack.get()) do
        active_plugins[plugin.spec.name] = plugin.active
    end

    for _, plugin in ipairs(vim.pack.get()) do
        if not active_plugins[plugin.spec.name] then
            table.insert(unused_plugins, plugin.spec.name)
        end
    end

    if #unused_plugins == 0 then
        print("No unused plugins.")
        return
    end

    local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
    if choice == 1 then
        vim.pack.del(unused_plugins)
    end
end)

map("n", "<leader>pu", function()
    local active_plugins = {}
    for _, plugin in ipairs(vim.pack.get()) do
        -- active_plugins[plugin.spec.name] = plugin.active
        table.insert(active_plugins, plugin.spec.name)
    end

    vim.pack.update(active_plugins)
end)

-- LuaSnip
map({ "i" }, "<C-k>", function() require("luasnip").expand() end, { silent = true })
map({ "i", "s" }, "<C-l>", function() require("luasnip").jump(1) end, { silent = true })
map({ "i", "s" }, "<C-j>", function() require("luasnip").jump(-1) end, { silent = true })
map({ "i", "s" }, "<C-e>", function()
    if require("luasnip").choice_expand() then
        require("luasnip").change_choice(1)
    end
end, { silent = true })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = {
                enable = false,
            },
        }
    }
})
vim.lsp.config("arduino_language_server", {
    cmd = {
        'arduino-language-server',
        '-cli-config',
        '$HOME/.arduino15/arduino-cli.yaml',
    },
})
