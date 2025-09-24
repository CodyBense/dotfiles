vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
-- vim.o.isfname:append("@-@")
vim.o.updatetime = 50
vim.o.colorcolumn = "80"
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.g.mapleader = " "

-- allows moving of selected lines and autoindent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- add next line at end and keeps cursor in current position
vim.keymap.set("n", "J", "mzJ`z")
-- half page jumps and keeys cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keeps cursor in place when searching terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- copys over and puts replace in void register
vim.keymap.set("x", "<leader>p", "\"_dP")
-- copys to computer clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
-- deletes to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
-- Q is a bad place?
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")


vim.pack.add({
    { src = 'https://github.com/catppuccin/nvim' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/nvim-mini/mini.pick' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
})

require "mason".setup()
vim.lsp.enable({ "lua_ls", "jedi_language_server" })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})

require "oil".setup()
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")

require "mini.pick".setup()
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")

vim.cmd("colorscheme catppuccin-mocha")
