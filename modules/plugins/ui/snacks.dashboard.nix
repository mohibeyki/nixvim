{
  plugins.snacks = {
    enable = true;
    settings.dashboard = {
      enabled = true;
      preset.keys = [
        {
          icon = "󰍉 ";
          key = "f";
          desc = "Find File";
          action = "<cmd>lua Snacks.picker.files({ hidden = true })<cr>";
        }
        {
          icon = "󱪞 ";
          key = "n";
          desc = "New File";
          action = ":ene | startinsert";
        }
        {
          icon = "󰺯 ";
          key = "g";
          desc = "Find Text";
          action = "<cmd>lua Snacks.picker.grep()<cr>";
        }
        {
          icon = "󰋚 ";
          key = "r";
          desc = "Recent Files";
          action = "<cmd>lua Snacks.picker.recent()<cr>";
        }
        {
          icon = "󰢻 ";
          key = "c";
          desc = "Config";
          action = "<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath('config'), hidden = true })<cr>";
        }
        {
          icon = "󰦛 ";
          key = "s";
          desc = "Restore Session";
          action.__raw = ''
            function()
              require("persistence").load()
            end
          '';
        }
        {
          icon = "󰈆 ";
          key = "q";
          desc = "Quit";
          action = ":qa";
        }
      ];
      sections = [
        { section = "header"; }
        {
          section = "keys";
          gap = 1;
          padding = 1;
        }
      ];
    };
  };
}
