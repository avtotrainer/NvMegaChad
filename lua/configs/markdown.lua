-- ~/.config/nvim/lua/configs/markdown.lua

-- Set colorcolumn only for markdown files
vim.cmd [[
  augroup Markdown
    autocmd!
    autocmd FileType markdown setlocal colorcolumn=80
  augroup END
]]
