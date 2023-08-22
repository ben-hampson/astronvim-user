-- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/test/neotest/init.lua
return {
  {
    "nvim-neotest/neotest-python"
  },
  {
    -- https://github.com/nvim-neotest/neotest-python
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    },
    opts = function()
      return {
        adapters = {
          -- https://github.com/nvim-neotest/neotest-python
          require("neotest-python")({
            dap = { justMyCode = false },
            args = {"--log-level", "DEBUG"},
            runner = "pytest",
          }),
        },
      }
    end,
  }
}
