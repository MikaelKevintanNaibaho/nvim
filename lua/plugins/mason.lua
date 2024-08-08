return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "eslint",
                "lua_ls",
                "jsonls",
                "tsserver",
                "pyright",
                "tailwindcss",
                "clangd", -- C/C++ LSP server
                "lemminx",
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua", -- lua formatter
                "eslint_d",
            },
        })
    end,
}
