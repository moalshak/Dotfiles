return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "taplo",             -- Toml
        "lua_ls",            -- Lua
        "ansiblels",         -- Ansible
        "azure_pipelines_ls",-- Azure Pipelines
        "bashls",            -- Bash/Shell scripting
        "bicep",             -- Azure Bicep
        "docker_compose_language_service", -- Docker Compose
        "dockerls",          -- Dockerfiles
        "gopls",             -- Go (Kubernetes/Platform tools)
        "helm_ls",           -- Kubernetes Helm Charts
        "html",              -- HTML
        "jsonls",            -- JSON (ARM templates, IAM policies)
        "marksman",          -- Markdown (Documentation)
        "omnisharp",         -- C# / .NET (full featured)
        "pyright",           -- Python (Scripting/Lambda)
        "terraformls",       -- Terraform
        "tflint",            -- Terraform Linter
        "ts_ls",             -- JavaScript / TypeScript
        "yamlls",            -- YAML (K8s, CloudFormation, CI/CD)
      },
      automatic_enable = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
