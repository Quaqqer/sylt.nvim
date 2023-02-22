if vim.fn.exists("b:did_ftplugin") then
   return
end

vim.b.did_ftplugin = 1

vim.bo.commentstring = "-- %s"
