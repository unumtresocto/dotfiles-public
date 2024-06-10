return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = function()
    require("luasnip").filetype_extend("typescript", { "angular" })
    require("luasnip").filetype_extend("html", { "angular" })
  end,
}
