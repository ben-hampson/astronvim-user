return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  plugins = {
    -- TODO: Move to user/plugsins/dap.lua
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
        handlers = {
          python = function(config)
            config.adapters.python = {
              type = "executable",
              command = "/Users/ben/.asdf/shims/python",
              args = {
                "-m",
                "debugpy.adapter",
              },
            }
            require("mason-nvim-dap").default_setup(config) -- Gets mason-nvim-dap to set up the debugger. No need for manually installing debugpy.

            -- dap.configurations.python = {
            --   {
            --     type = "python",
            --     request = "launch",
            --     name = "Launch file",
            --     program = "${file}", -- This configuration will launch the current file if used.
            --   },
            -- }
          end,
        },
        ensure_installed = { "python" } -- mason-nvim-dap installs these automatically
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Run dap-ui when a debugging session is started
    local dap = require("dap")
    local dapui = require("dapui")
    dap.listeners.after.event_initialized["dapui_config"]=function()
      vim.cmd.Neotree "action=close"
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"]=function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"]=function()
      dapui.close()
    end
  end,
}

