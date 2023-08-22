return {
  {
    "nvim-neotest/neotest-python"
  },
  {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    },
    opts = function()
      return {
        adapters = {
          require "neotest-python"
          --   ({
          --   -- neotest-python config
          --   -- Extra arguments for nvim-dap configuration
          --   -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
          --   dap = { justMyCode = false },
          --   runner = "pytest",
          --   -- Command line arguments for runner
          --   -- Can also be a function to return dynamic values
          --   args = {"--log-level", "DEBUG"},
          -- }
          -- )
        }
      }
      end,
  }
}
