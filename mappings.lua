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
    },
    ["<S-F11>"] = { function() require("dap").step_out() end, desc = "Debugger: Step Out" },
    ["<C-F5>"] = { function() require("dap").restart_frame() end, desc = "Debugger: Restart" },
    --["<C-Y>"] = { function() require("dapui").elements.repl.toggle() end, desc = "Debugger: Toggle Console" }, -- I don't think nvim-dap-ui has a way to focus on REPL.

    -- neotest
    ["<leader>js"] = { function() require('neotest').summary.toggle() end, desc = "Test [S]ummary" },

    ["<leader>jf"] = { function() require('neotest').run.run(vim.fn.expand('%')) end, desc = "Test [F]ile" },
    ["<leader>jF"] = { function() require('neotest').run.run({vim.fn.expand('%'), strategy='dap' }) end, desc = "Test + Debug [F]ile"}, -- Error expecting luv callback

    ["<leader>jn"] = { function() require('neotest').run.run() end, desc = "Test [N]earest" },
    ["<leader>jN"] = { function() require('neotest').run.run({ strategy='dap' }) end, desc = "Test + Debug [N]earest"},

    ["<leader>jl"] = { function() require('neotest').run.run_last() end, desc = "[L]ast Test" },
    ["<leader>jL"] = { function() require('neotest').run.run_last({ strategy='dap' }) end, desc = "Debug [L]ast Test" },

    ["<leader>jo"] = { function() require('neotest').output.open({ enter=true }) end, desc = "Test [O]utput" },
  },
  t = {
  },
}
