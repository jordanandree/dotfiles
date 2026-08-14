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

        require("fidget").setup({})
        require("mason").setup()
        local servers = {
            "lua_ls", -- lua
            "ts_ls",  -- js / ts
            "eslint", -- formatting
            "yamlls", -- yaml
            "jsonls", -- json
            "bashls", -- bash
        }

        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_enable = false,
        })

        local function root_dir_for(markers)
            return function(bufnr, on_dir)
                local root = vim.fs.root(bufnr, markers)
                if root then
                    on_dir(root)
                end
            end
        end

        local server_configs = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.1" },
                        diagnostics = {
                            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                        }
                    }
                }
            },
            yamlls = {
                on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = true
                end,
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
            },
            ts_ls = {
                root_dir = root_dir_for({ "package.json" }),
                workspace_required = true,
            },
        }

        for _, server_name in ipairs(servers) do
            vim.lsp.config(server_name, vim.tbl_deep_extend(
                "force",
                { capabilities = capabilities },
                server_configs[server_name] or {}
            ))
        end

        vim.lsp.config("denols", {
            capabilities = capabilities,
            root_dir = root_dir_for({ "deno.json" }),
        })

        vim.lsp.enable({
            "lua_ls",
            "ts_ls",
            "eslint",
            "yamlls",
            "jsonls",
            "bashls",
            "denols",
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

    end
}
