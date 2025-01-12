return {
  "apple/pkl-neovim",
  ft = "pkl",
  config = function()
    -- Set up snippets.
    require("luasnip.loaders.from_snipmate").lazy_load()
  end,
}
