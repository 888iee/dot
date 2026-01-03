return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = function(_, opts)
    opts = opts or {}

    -- Explorer Konfiguration
    opts.explorer = vim.tbl_deep_extend("force", opts.explorer or {}, {
      enabled = true,
    })

    return opts
  end,

  init = function()
    -- Öffne Explorer beim Start
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.defer_fn(function()
          local ok, snacks = pcall(require, "snacks")
          if ok then
            if snacks.explorer then
              snacks.explorer.open()
            end
          end
        end, 100)
      end,
    })
  end,

  keys = {
    {
      "<C-\\>",
      function()
        require("snacks").terminal.toggle()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<leader>tt",
      function()
        require("snacks").terminal.toggle()
      end,
      desc = "Toggle Terminal",
    },
  },
}
