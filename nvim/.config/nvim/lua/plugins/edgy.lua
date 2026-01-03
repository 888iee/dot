return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  opts = {
    left = {
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.65 },
        pinned = true,
        open = "Neotree show",
      },
      {
        title = "Aerial",
        ft = "aerial",
        pinned = true,
        open = "AerialOpen",
        size = { height = 0.35 },
      },
    },
    bottom = {
      {
        ft = "toggleterm",
        size = { height = 15 },
      },
    },
  },
}
