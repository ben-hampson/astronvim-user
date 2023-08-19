-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<F5>"] = {
      function()
        require('dap.ext.vscode').load_launchjs(nil, {}) -- By default, load .vscode/launch.json as the project debugging configuration. 
        require("dap").continue()
      end,
      desc = "Debugger: Start" },
    ["<F17>"] = false,
    ["<F21>"] = false,
    ["<S-F5>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" },
    ["<S-F9>"] = {
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          if condition then require("dap").set_breakpoint(condition) end
        end)
      end,
      desc = "Debugger: Conditional Breakpoint",
    }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
