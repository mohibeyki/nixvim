{
  imports = [
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

    dap-ui.enable = true;
    dap-virtual-text.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>db";
      action.__raw = ''
        function()
          require("dap").toggle_breakpoint()
        end
      '';
      options = {
        desc = "Toggle Breakpoint";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dB";
      action.__raw = ''
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end
      '';
      options = {
        desc = "Toggle Conditional Breakpoint";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dL";
      action.__raw = ''
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end
      '';
      options = {
        desc = "Toggle Log Point";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dC";
      action.__raw = ''
        function()
          require("dap").clear_breakpoints()
        end
      '';
      options = {
        desc = "Clear All Breakpoints";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dc";
      action.__raw = ''
        function()
          require("dap").continue()
        end
      '';
      options = {
        desc = "Continue / Start Debugging";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dR";
      action.__raw = ''
        function()
          require("dap").run_last()
        end
      '';
      options = {
        desc = "Run Last Debug Configuration";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dx";
      action.__raw = ''
        function()
          require("dap").terminate()
        end
      '';
      options = {
        desc = "Terminate Debug Session";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dX";
      action.__raw = ''
        function()
          require("dap").disconnect()
        end
      '';
      options = {
        desc = "Disconnect from Debug Session";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>di";
      action.__raw = ''
        function()
          require("dap").step_into()
        end
      '';
      options = {
        desc = "Step Into";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>do";
      action.__raw = ''
        function()
          require("dap").step_over()
        end
      '';
      options = {
        desc = "Step Over";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dO";
      action.__raw = ''
        function()
          require("dap").step_out()
        end
      '';
      options = {
        desc = "Step Out";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dr";
      action.__raw = ''
        function()
          require("dap").repl.open()
        end
      '';
      options = {
        desc = "Open Debug REPL";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dK";
      action.__raw = ''
        function()
          require("dap").up()
        end
      '';
      options = {
        desc = "Go Up in Call Stack";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dJ";
      action.__raw = ''
        function()
          require("dap").down()
        end
      '';
      options = {
        desc = "Go Down in Call Stack";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>du";
      action.__raw = ''
        function()
          require("dapui").toggle()
        end
      '';
      options = {
        desc = "Toggle Debug UI";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>de";
      action.__raw = ''
        function()
          require("dapui").eval()
        end
      '';
      options = {
        desc = "Evaluate Expression";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>dE";
      action.__raw = ''
        function()
          require("dapui").eval(vim.fn.input("Expression: "))
        end
      '';
      options = {
        desc = "Evaluate Input Expression";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dl";
      action.__raw = ''
        function()
          require("dap").list_breakpoints()
        end
      '';
      options = {
        desc = "List All Breakpoints";
        silent = true;
      };
    }
  ];

  extraConfigLua = ''
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      icons = {
        expanded = "▾",
        collapsed = "▸",
        current_frame = "▸",
      },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "⏴",
          run_last = "↻",
          terminate = "⏹",
        },
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.33 },
            { id = "breakpoints", size = 0.33 },
            { id = "stacks", size = 0.34 },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          position = "bottom",
          size = 10,
        },
      },
    })

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
