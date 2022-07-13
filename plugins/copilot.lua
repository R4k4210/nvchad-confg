-- vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-Right>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- //  Esto es lo mismo, la forma de arriba es mejor
-- vim.cmd([[
  -- let g:copilot_no_tab_map = v:true
  -- let g:copilot_assume_mapped = v:true
-- ]])
