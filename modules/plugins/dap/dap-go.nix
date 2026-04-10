{
  config,
  lib,
  ...
}:
lib.mkIf (lib.elem "go" config.languages.enabled) {
  plugins.dap-go = {
    enable = true;
  };

  keymaps = [
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
  ];
}
