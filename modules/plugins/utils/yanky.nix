{
  plugins.yanky = {
    enable = true;
    settings = {
      highlight = {
        timer = 150;
      };
      system_clipboard = {
        sync_with_ring = true;
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>p";
      action.__raw = ''
        function()
          require("snacks").picker.yanky()
        end
      '';
      options = {
        desc = "Open Yank History";
      };
    }
    {
      mode = "n";
      key = "[y";
      action = "<Plug>(YankyCycleForward)";
      options = {
        desc = "Cycle Forward Through Yank History";
      };
    }
    {
      mode = "n";
      key = "]y";
      action = "<Plug>(YankyCycleBackward)";
      options = {
        desc = "Cycle Backward Through Yank History";
      };
    }
  ];
}
