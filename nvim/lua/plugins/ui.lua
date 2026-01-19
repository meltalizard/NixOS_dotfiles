return {
  -- Command-line completion with suggestions
  {
    "hrsh7th/cmp-cmdline",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      local cmp = require("cmp")
      
      -- `/` and `?` command-line completion (search)
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      
      -- `:` command-line completion (commands)
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'cmdline' },
          { name = 'path' }
        }
      })
    end,
  },
  
  -- Path completion (for file paths)
  { "hrsh7th/cmp-path" },
}
