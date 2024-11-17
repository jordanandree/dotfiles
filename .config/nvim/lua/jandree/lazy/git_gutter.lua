return {
    "airblade/vim-gitgutter",
    config = function()
        vim.keymap.set("n", "]h", function()
            vim.cmd.GitGutterNextHunk()
        end, { desc = "Go to next git hunk" })

        vim.keymap.set("n", "[h", function()
            vim.cmd.GitGutterPrevHunk()
        end, { desc = "Go to previous git hunk" })
    end
}
