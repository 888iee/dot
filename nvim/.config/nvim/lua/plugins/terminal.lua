return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 15,
    direction = "horizontal",
    open_mapping = [[<c-\>]],
    close_on_exit = true,
    shell = vim.o.shell,
    persist_size = true,
    start_in_insert = false,
    auto_scroll = true,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.defer_fn(function()
          local current_win = vim.api.nvim_get_current_win()
          vim.cmd("ToggleTerm")
          -- Zurück zum ursprünglichen Fenster
          vim.api.nvim_set_current_win(current_win)
        end, 500)
      end,
    })
  end,
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = { "n", "t" } },
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
  },
}
