return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Set up capabilities with snippet support
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      
      -- Modern way - direct vim.lsp setup
      vim.lsp.config('pyright', {})
      vim.lsp.config('clangd', {})
      vim.lsp.config('lua_ls', {})
      vim.lsp.config('dartls', {
        cmd = { "dart", "language-server", "--protocol=lsp"},
        filetypes = { "dart" },
        root_markers = { "pubspec.yaml" },
        capabilities = capabilities,
        settings = {
          dart = {
            completeFunctionCalls = true,
            showTodos = true,
          }
        },
        init_options = {
          onlyAnalyzeProjectsWithOpenFiles = false,
          suggestFromUnimportedLibraries = true,
          closingLabels = true,
          outline = true,
          flutterOutline = true,
        },
      })
      
      -- Enable them
      vim.lsp.enable('pyright')
      vim.lsp.enable('clangd')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('dartls')
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
