return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Python
      vim.lsp.config("pyright", {})
      vim.lsp.enable("pyright")

      -- C/C++
      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })
      vim.lsp.enable("clangd")

      -- Lua
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      vim.lsp.enable("lua_ls")

      -- Dart / Flutter
      vim.lsp.config("dartls", {
        cmd = { "dart", "language-server", "--protocol=lsp" },
        filetypes = { "dart" },
        root_markers = { "pubspec.yaml" },
        capabilities = capabilities,
        settings = {
          dart = {
            completeFunctionCalls = true,
            showTodos = true,
          },
        },
        init_options = {
          onlyAnalyzeProjectsWithOpenFiles = false,
          suggestFromUnimportedLibraries = true,
          closingLabels = true,
          outline = true,
          flutterOutline = true,
        },
      })
      vim.lsp.enable("dartls")

      -- HTML
      vim.lsp.config("html", {
        capabilities = capabilities,
        filetypes = { "html", "htmldjango" },
      })
      vim.lsp.enable("html")

      -- CSS / SCSS / Less
      vim.lsp.config("cssls", {
        capabilities = capabilities,
        filetypes = { "css", "scss", "less" },
      })
      vim.lsp.enable("cssls")
    end,
  },
}
