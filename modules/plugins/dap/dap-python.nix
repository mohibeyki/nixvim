{
  config,
  lib,
  ...
}:
lib.mkIf (lib.elem "python" config.languages.enabled) {
  plugins.dap-python = {
    enable = true;

    settings = {
      console = "integratedTerminal";
      pythonPath = null;
      justMyCode = false;
      subProcess = false;
    };
  };

  keymaps = [
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
      key = "<leader>dps";
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
