-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Disable LazyVim's default <leader>e mapping first (optional but recommended)
pcall(vim.keymap.del, "n", "<leader>e")

vim.keymap.set("n", "<leader>e", function()
  -- Find the Snacks Explorer window (it uses this filetype)
  local explorer_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "snacks_picker_list" then
      explorer_win = win
      break
    end
  end

  -- If it's open but not focused → focus it. Otherwise → toggle (open/close).
  if explorer_win and vim.api.nvim_get_current_win() ~= explorer_win then
    vim.api.nvim_set_current_win(explorer_win)
  else
    Snacks.explorer() -- root dir explorer (same action LazyVim binds to <leader>e)
  end
end, { desc = "Explorer (focus if open, else toggle)" })
