return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitconfig",
        "LazyGitCurrentFiles",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazygit" },
    },
}
