return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		require("mason-null-ls").setup({
			ensure_installed = nil, -- install everything the sources below reference
			automatic_installation = true,
		})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.formatting.black, -- Python
				null_ls.builtins.formatting.isort, -- Python imports
				null_ls.builtins.formatting.shfmt, -- Shell
				null_ls.builtins.formatting.gofmt, -- Go
				null_ls.builtins.formatting.terraform_fmt, -- Terraform
				null_ls.builtins.formatting.yamlfmt, -- YAML
				null_ls.builtins.formatting.taplo, -- TOML
				null_ls.builtins.formatting.csharpier, -- C#
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
