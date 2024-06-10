local M = {}

M.run_in_folder = function(path, cmd)
  if #cmd == 0 then
    return
  end

  local bufnr = vim.api.nvim_create_buf(true, true)
  local term_cmd = "cd " .. path .. " && " .. cmd

  vim.api.nvim_open_win(bufnr, true, {
    relative = "win",
    width = 80,
    height = 10,
    row = 3,
    col = 3,
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen(term_cmd)
  vim.cmd("startinsert")
end

M.open_in_terminal = function(path)
  M.run_in_folder(path, "$SHELL")
end

return M
