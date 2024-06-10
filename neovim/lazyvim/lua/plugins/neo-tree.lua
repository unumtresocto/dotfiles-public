local get_neo_tree_node_path = function(state)
  local node = state.tree:get_node()
  local path = node.path
  local type = node.type

  return { path, type }
end

return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = {
    window = {
      mappings = {
        ["<leader>gt"] = {
          function(state)
            local path, type = unpack(get_neo_tree_node_path(state))

            if type == "directory" then
              require("utils").open_in_terminal(path)
            end
          end,
          desc = "Open in terminal",
        },
        ["<leader>rt"] = {
          function(state)
            local path, type = unpack(get_neo_tree_node_path(state))

            if type == "directory" then
              local cmd = vim.fn.input("Command: ") or ""

              if #cmd > 0 then
                require("utils").run_in_folder(path, cmd)
              end
            end
          end,
          desc = "Run in terminal",
        },
      },
    },
  },
}
