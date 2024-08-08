return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local nvim_lsp = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        local protocol = require("vim.lsp.protocol")

        local on_attach = function(client, bufnr)
            -- format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })
            end
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        mason_lspconfig.setup_handlers({
            function(server)
                nvim_lsp[server].setup({
                    on_attach = on_attach,
                    on_init = on_init,
                    capabilities = capabilities,
                })
            end,
            ["tsserver"] = function()
                nvim_lsp["tsserver"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["jsonls"] = function()
                nvim_lsp["jsonls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["pyright"] = function()
                nvim_lsp["pyright"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["clangd"] = function()
                nvim_lsp["clangd"].setup({
                    on_attach = function(client, bufnr)
                        client.server_capabilities.documentFormattingProvider = false
                        client.server_capabilities.documentRangeFormattingProvider = false
                        on_attach(client, bufnr)
                    end,
                    on_init = on_init,
                    capabilities = capabilities,
                })
            end,
            ["lemminx"] = function()
                nvim_lsp["lemminx"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                nvim_lsp["lua_ls"].setup({
                    on_attach = on_attach,
                    on_init = on_init,
                    capabilities = capabilities,

                    settings = {
                        Lua = {
                            diagnostics = {
                                enable = false, --disable all diagnotics from lua_ls
                            },
                            workspace = {
                                library = {
                                    vim.fn.expand("$VIMRUNTIME/lua"),
                                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                                },
                                maxPreload = 10000,
                                preloadFilesSize = 10000,
                            },
                        },
                    },
                })
            end,
        })
    end,
}
