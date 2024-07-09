return {
  "hrsh7th/nvim-cmp",
  opts = {
    completion = {
      autocomplete = false, -- ავტოკომპლიტის ავტომატური გამოტანის აკრძალვა
    },
    sources = {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  },
}
