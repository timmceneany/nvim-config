return {
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      -- Eval var under cursor
      -- vim.keymap.set("n", "<space>?", function()
      --   require("dapui").eval(nil, { enter = true })
      -- end)
      vim.keymap.set("n", "<F2>", dapui.close)

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close()
      -- end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      vim.keymap.set("n", "<F8>", dap.continue)
      vim.keymap.set("n", "<F10>", dap.step_into)
      vim.keymap.set("n", "<F9>", dap.step_over)
      vim.keymap.set("n", "<F6>", dap.step_out)
      vim.keymap.set("n", "<F7>", dap.step_back)
      vim.keymap.set("n", "<F11>", dap.restart)
      vim.keymap.set("n", "<F12>", dap.terminate)

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.env.HOME .. "/.local/share/nvim/mason/bin/codelldb",
          args = { "--port", "${port}" },
          detached = false,
        },
      }

      dap.configurations.rust = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      -- local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      local path = "/home/tmceneany/code/dagster-refdata/envs/default/bin/python"
      -- local path = "/home/tmceneany/code/meter/envs/default/bin/python"
      require("dap-python").setup(path)
      local dappy = require("dap-python")
      vim.keymap.set("n", "<F1>", dappy.test_method)
      -- dappy.test_runner = "pytest"
      -- dappy.resolve_python = function()
      --   return "/home/tmceneany/code/meter/envs/default"
      -- end
      -- table.insert(require("dap").configurations.python, {
      --   type = "python",
      --   request = "launch",
      --   name = "custom launch config",
      --   program = "${file}",
      --   python = "/home/tmceneany/code/meter/envs/default/bin/",
      --   cwd = "/home/tmceneany/code/meter",
      -- })
    end,
  },
}
