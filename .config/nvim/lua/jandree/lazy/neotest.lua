return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",

            "marilari88/neotest-vitest",
            "markemmons/neotest-deno"
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-vitest"),
                    require("neotest-deno"),
                }
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end, { desc = "Run test for line" })
        end,
    },
}
