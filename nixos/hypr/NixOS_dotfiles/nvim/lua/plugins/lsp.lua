return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Modern way - direct vim.lsp setup
      vim.lsp.config('pyright', {})
      vim.lsp.config('clangd', {})
      vim.lsp.config('lua_ls', {})

      vim.lsp.config('dartls', {
        cmdd = { "dart", "language-server", "--protocol=lsp"},
        filetypes = { "dart" },
        root_markers = { "pubspec.yaml" },


      })

      
      -- Enable them
      vim.lsp.enable('pyright')
      vim.lsp.enable('clangd')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('dartls')
    end,
  },

  -- Auto-completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end,
  },
}
