return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")

			local capabilities = cmp_nvim_lsp.default_capabilities()

			mason.setup()

			local servers = { 
				"rust_analyzer", 
				"lua_ls",
				"texlab",	
				"marksman" 
			}

			mason_lspconfig.setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			for _, server_name in ipairs(servers) do
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
}
