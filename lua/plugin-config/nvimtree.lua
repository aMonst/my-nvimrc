require("nvim-tree").setup({
    filters = {
        dotfiles = true,
        custom = {
            ".git/"
        },

        exclude = {
            ".gitignore"
        },
    },
    git = {
        enable = true
    },
})
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
