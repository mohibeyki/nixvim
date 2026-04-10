{ config, lib, ... }:
{
  keymaps = [
    # ── core DAP ──────────────────────────────────────────────────────────────
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
        desc = "Breakpoint Condition";
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
      key = "<leader>dbc";
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
      key = "<leader>dC";
      action.__raw = ''
        function()
          require("dap").run_to_cursor()
        end
      '';
      options = {
        desc = "Run to Cursor";
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
        desc = "Run/Continue";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dg";
      action.__raw = ''
        function()
          require("dap").goto_()
        end
      '';
      options = {
        desc = "Go to Line (No Execute)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>da";
      action.__raw = ''
        function()
          local dap = require("dap")
          dap.continue({
            before = function(config)
              local args = vim.fn.input("Run args: ")
              config = vim.deepcopy(config)
              config.args = vim.split(args, " ", { trimempty = true })
              return config
            end,
          })
        end
      '';
      options = {
        desc = "Run with Args";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dt";
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
      key = "<leader>dx";
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
      key = "<leader>dO";
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
      key = "<leader>dr";
      action.__raw = ''
        function()
          require("dap").repl.open()
        end
      '';
      options = {
        desc = "Toggle REPL";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dk";
      action.__raw = ''
        function()
          require("dap").up()
        end
      '';
      options = {
        desc = "Up in Call Stack";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dj";
      action.__raw = ''
        function()
          require("dap").down()
        end
      '';
      options = {
        desc = "Down in Call Stack";
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
          require("dap").run_last()
        end
      '';
      options = {
        desc = "Run Last";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dw";
      action.__raw = ''
        function()
          require("dapui").toggle("widgets")
        end
      '';
      options = {
        desc = "Widgets";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dP";
      action.__raw = ''
        function()
          require("dap").pause()
        end
      '';
      options = {
        desc = "Pause";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ds";
      action.__raw = ''
        function()
          require("dap").session()
        end
      '';
      options = {
        desc = "Session";
        silent = true;
      };
    }
  ]
  # ── Go (conditional) ──────────────────────────────────────────────────────
  ++ lib.optionals (lib.elem "go" config.languages.enabled) [
    {
      mode = "n";
      key = "<leader>dgt";
      action.__raw = ''
        function()
          require("dap-go").debug_test()
        end
      '';
      options = {
        desc = "Debug Go Test";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dgl";
      action.__raw = ''
        function()
          require("dap-go").debug_last_test()
        end
      '';
      options = {
        desc = "Debug Last Go Test";
        silent = true;
      };
    }
  ]
  # ── Python (conditional) ──────────────────────────────────────────────────
  ++ lib.optionals (lib.elem "python" config.languages.enabled) [
    {
      mode = "n";
      key = "<leader>dpm";
      action.__raw = ''
        function()
          require("dap-python").test_method()
        end
      '';
      options = {
        desc = "Debug Python Test Method";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dpc";
      action.__raw = ''
        function()
          require("dap-python").test_class()
        end
      '';
      options = {
        desc = "Debug Python Test Class";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dpS";
      action.__raw = ''
        function()
          require("dap-python").debug_selection()
        end
      '';
      options = {
        desc = "Debug Python Selection";
        silent = true;
      };
    }
  ];
}
