-- example file i.e lua/custom/init.lua

vim.cmd [[augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.html mkview
  autocmd BufWinEnter *.html silent! loadview
augroup END]]
-- load your globals, autocmds here or anything .__.
