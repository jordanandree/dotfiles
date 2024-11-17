return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                dark_variant = "moon"
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight"
    }
}
