local nvim_lsp = require("lspconfig")

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim"
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())
        local lspconfig = require("lspconfig")

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls", -- lua
                "ts_ls",  -- js / ts
                "denols", -- deno
                "eslint", -- formatting
                "yamlls", -- yaml
                "jsonls", -- json
                "bashls", -- bash
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ["yamlls"] = function()
                    lspconfig.yamlls.setup {
                        on_attach = function(client)
                            client.server_capabilities.documentFormattingProvider = true
                        end,
                        capabilities = capabilities,
                        settings = {
                            yaml = {
                                format = {
                                    enable = true
                                },
                                schemaStore = {
                                    enable = true
                                }
                            }
                        }
                    }
                end
            }
        })

        require("mason-tool-installer").setup({
            "prettier"
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources(
                {
                    { name = 'nvim_lsp' },
                }, {
                    { name = 'buffer' },
                }
            )
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })


        nvim_lsp.denols.setup {
            root_dir = nvim_lsp.util.root_pattern("deno.json"),
        }

        nvim_lsp.ts_ls.setup {
            root_dir = nvim_lsp.util.root_pattern("package.json"),
            single_file_support = false,
        }
    end
}
