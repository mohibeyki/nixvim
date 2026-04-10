{ pkgs, ... }:
{
  plugins.snacks = {
    enable = true;
    settings = {
      bufdelete.enabled = true;

      bigfile = {
        enabled = true;
        size = 1.5 * 1024 * 1024; # 1.5 MB
        line_length = 1000;
      };

      indent = {
        enabled = true;
        indent.char = "│";
        scope = {
          enabled = true;
          char = "╎";
        };
      };

      scope = {
        enabled = true;
        cursor = true;
        hl = "SnacksIndentScope";
        char = "│";
      };

      dashboard = {
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

      picker = {
        enabled = true;
      };

      terminal = {
        enabled = true;
      };

      image = {
        enabled = true;
      };

      notifier = {
        enabled = true;
        timeout = 3000;
      };

      toggle = { };

      words.enabled = true;

      rename.enabled = true;

      input.enabled = true;

      scroll.enabled = true;

      explorer.enabled = true;

      quickfile.enabled = true;

      statuscolumn = {
        enabled = true;
        left = [
          "mark"
          "sign"
          "fold"
        ];
        right = [
          "line"
          "relativenumber"
        ];
      };
    };
  };
}
