_: {
  imports = [
    ./keymaps.nix
    ./dap-go.nix
    ./dap-python.nix
  ];

  plugins = {
    dap = {
      enable = true;

      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "◐";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
        dapStopped = {
          text = "▶";
          texthl = "DapStopped";
          linehl = "DapStopped";
          numhl = "DapStopped";
        };
        dapBreakpointRejected = {
          text = "✖";
          texthl = "DapBreakpointRejected";
        };
      };
    };

    dap-ui = {
      enable = true;
      settings = {
        icons = {
          expanded = "▾";
          collapsed = "▸";
          current_frame = "▸";
        };
        controls = {
          icons = {
            pause = "⏸";
            play = "▶";
            step_into = "⏎";
            step_over = "⏭";
            step_out = "⏮";
            step_back = "⏴";
            run_last = "↻";
            terminate = "⏹";
          };
        };
        layouts = [
          {
            elements = [
              { id = "scopes"; size = 0.33; }
              { id = "breakpoints"; size = 0.33; }
              { id = "stacks"; size = 0.34; }
            ];
            position = "left";
            size = 40;
          }
          {
            elements = [
              { id = "repl"; size = 0.5; }
              { id = "console"; size = 0.5; }
            ];
            position = "bottom";
            size = 10;
          }
        ];
      };
    };

    dap-virtual-text.enable = true;
  };

  extraConfigLua = ''
    local dap = require("dap")
    local dapui = require("dapui")

    vim.api.nvim_set_hl(0, "DapBreakpoint", { default = true, link = "DiagnosticError" })
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { default = true, link = "DiagnosticWarn" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { default = true, link = "DiagnosticInfo" })
    vim.api.nvim_set_hl(0, "DapStopped", { default = true, link = "DiagnosticOk" })
    vim.api.nvim_set_hl(0, "DapBreakpointRejected", { default = true, link = "DiagnosticHint" })
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  '';
}
