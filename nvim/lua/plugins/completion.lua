return {
  -- Auto-completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local luasnip = require("luasnip")
      
      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      
      -- Add custom Flutter snippets
      luasnip.add_snippets("dart", {
        luasnip.snippet("stless", {
          luasnip.text_node("class "),
          luasnip.insert_node(1, "WidgetName"),
          luasnip.text_node(" extends StatelessWidget {"),
          luasnip.text_node({"", "  const "}),
          luasnip.insert_node(2, "WidgetName"),
          luasnip.text_node("({super.key});"),
          luasnip.text_node({"", "", "  @override"}),
          luasnip.text_node({"", "  Widget build(BuildContext context) {"}),
          luasnip.text_node({"", "    return "}),
          luasnip.insert_node(0, "Container()"),
          luasnip.text_node(";"),
          luasnip.text_node({"", "  }"}),
          luasnip.text_node({"", "}"}),
        }),
        luasnip.snippet("stful", {
          luasnip.text_node("class "),
          luasnip.insert_node(1, "WidgetName"),
          luasnip.text_node(" extends StatefulWidget {"),
          luasnip.text_node({"", "  const "}),
          luasnip.insert_node(2, "WidgetName"),
          luasnip.text_node("({super.key});"),
          luasnip.text_node({"", "", "  @override"}),
          luasnip.text_node({"", "  State<"}),
          luasnip.insert_node(3, "WidgetName"),
          luasnip.text_node("> createState() => _"),
          luasnip.insert_node(4, "WidgetName"),
          luasnip.text_node("State();"),
          luasnip.text_node({"", "}"}),
          luasnip.text_node({"", "", "class _"}),
          luasnip.insert_node(5, "WidgetName"),
          luasnip.text_node("State extends State<"),
          luasnip.insert_node(6, "WidgetName"),
          luasnip.text_node("> {"),
          luasnip.text_node({"", "  @override"}),
          luasnip.text_node({"", "  Widget build(BuildContext context) {"}),
          luasnip.text_node({"", "    return "}),
          luasnip.insert_node(0, "Container()"),
          luasnip.text_node(";"),
          luasnip.text_node({"", "  }"}),
          luasnip.text_node({"", "}"}),
        }),
      })
      
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "luasnip", priority = 1000 },
          { name = "nvim_lsp", priority = 900 },
          { name = "buffer", priority = 500 },
          { name = "path", priority = 400 },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
      })
    end,
  },
}
