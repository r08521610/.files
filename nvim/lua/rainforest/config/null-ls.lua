local null_ls = require("null-ls")


null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.yapf.with({
			args = { "--style", "{based_on_style: pep8, indent_width: 2, column_limit: 100}" },
		}),
		null_ls.builtins.code_actions.gitsigns,
	},
	on_attach = function(client)
		-- format on save
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
			]])
			vim.notify("Auto Formatting On", "info")
		end
	end,
})
