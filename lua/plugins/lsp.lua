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

        local clang_format_config = {
            BasedOnStyle = "WebKit",
            Language = "Cpp",
            ColumnLimit = 100,
            PointerBindsToType = false,
            BreakBeforeBinaryOperators = "NonAssignment",
            BreakBeforeBraces = "Custom",
            BraceWrapping = {
                AfterClass = true,
                AfterControlStatement = false,
                AfterEnum = false,
                AfterFunction = true,
                AfterCaseLabel = true,
                AfterNamespace = false,
                AfterObjCDeclaration = false,
                AfterStruct = true,
                AfterUnion = false,
                BeforeCatch = false,
                BeforeElse = false,
                IndentBraces = false,
            },
            AlignAfterOpenBracket = true,
            AlwaysBreakTemplateDeclarations = true,
            AllowShortEnumsOnASingleLine = false,
            AllowShortFunctionsOnASingleLine = "Empty",
            SortIncludes = false,        
        }

		mason_lspconfig.setup_handlers({
			function(server)
				nvim_lsp[server].setup({
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
					on_attach = on_attach,
					capabilities = capabilities,
					init_options = {
						clangdFileStatus = true,
                        format = {
                            enable = true,
                            clang_format_config = clang_format_config,
                        }
					},
                    --cmd = { "clangd", "--compile-commands-dir=build" }
				})
			end,
            ["lemminx"] = function()
                nvim_lsp["lemminx"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,           			
		})
	end,
}
