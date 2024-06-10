return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.beautysh.with({
          command = "/home/one38/.venv/bin/beautysh",
          args = {
            "--indent-size",
            "2",
            "$FILENAME",
          },
        }),
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        angularls = {
          root_dir = require("lspconfig.util").root_pattern("angular.json", "project.json"),
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-angular",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
