-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Snacks Explorer automatisch öffnen
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Kurze Verzögerung damit alles geladen ist
    vim.defer_fn(function()
      if vim.fn.argc() == 0 then
        -- Öffne Explorer nur wenn keine Datei angegeben wurde
        require("snacks").explorer.open()
      end
    end, 100)
  end,
})
