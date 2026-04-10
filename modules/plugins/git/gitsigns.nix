{ pkgs, ... }:
{
  plugins.gitsigns = {
    enable = true;
    settings = {
      signs = {
        add = {
          text = "▎";
        };
        change = {
          text = "▎";
        };
        delete = {
          text = "✖";
        };
        topdelete = {
          text = "✖";
        };
        changedelete = {
          text = "▎";
        };
      };
      sign_column = true;
      numhl = false;
      linehl = false;
      watch_interval = 1000;
      on_attach = null;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "]c";
      action.__raw = ''
        function()
          require("gitsigns").next_hunk()
        end
      '';
      options = {
        desc = "Next Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "[c";
      action.__raw = ''
        function()
          require("gitsigns").prev_hunk()
        end
      '';
      options = {
        desc = "Prev Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action.__raw = ''
        function()
          require("gitsigns").stage_hunk()
        end
      '';
      options = {
        desc = "Stage Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gS";
      action.__raw = ''
        function()
          require("gitsigns").undo_stage_hunk()
        end
      '';
      options = {
        desc = "Unstage Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gr";
      action.__raw = ''
        function()
          require("gitsigns").reset_hunk()
        end
      '';
      options = {
        desc = "Reset Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gR";
      action.__raw = ''
        function()
          require("gitsigns").reset_buffer()
        end
      '';
      options = {
        desc = "Reset Buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gp";
      action.__raw = ''
        function()
          require("gitsigns").preview_hunk()
        end
      '';
      options = {
        desc = "Preview Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action.__raw = ''
        function()
          require("gitsigns").blame_line({ full = false })
        end
      '';
      options = {
        desc = "Blame Line";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action.__raw = ''
        function()
          require("gitsigns").diffthis()
        end
      '';
      options = {
        desc = "Diff This";
        silent = true;
      };
    }
  ];
}
