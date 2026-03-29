{ config, lib, ... }:
{
  plugins.gitsigns = {
    enable = true;
    settings = {
      trouble = true;
      current_line_blame = true;
      current_line_blame_formatter = "   <author>, <committer_time:%R> • <summary>";
      signs = {
        add = {
          text = "│";
        };
        change = {
          text = "│";
        };
        delete = {
          text = "_";
        };
        topdelete = {
          text = "‾";
        };
        changedelete = {
          text = "~";
        };
        untracked = {
          text = "│";
        };
      };
    };
  };
  keymaps = lib.mkIf config.plugins.gitsigns.enable [
    # Stage/reset hunks
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ghs";
      action = "<cmd>Gitsigns stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Stage Hunk";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ghr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
      options = {
        silent = true;
        desc = "Reset Hunk";
      };
    }

    # Preview hunk
    {
      mode = "n";
      key = "<leader>ghp";
      action = "<cmd>Gitsigns preview_hunk_inline<CR>";
      options = {
        silent = true;
        desc = "Preview Hunk Inline";
      };
    }

    # Buffer operations
    {
      mode = "n";
      key = "<leader>ghS";
      action = "<cmd>Gitsigns stage_buffer<CR>";
      options = {
        silent = true;
        desc = "Stage Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>ghu";
      action = "<cmd>Gitsigns undo_stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Undo Stage Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>ghR";
      action = "<cmd>Gitsigns reset_buffer<CR>";
      options = {
        silent = true;
        desc = "Reset Buffer";
      };
    }

    # Diff operations
    {
      mode = "n";
      key = "<leader>ghd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options = {
        silent = true;
        desc = "Diff This";
      };
    }
    {
      mode = "n";
      key = "<leader>ghD";
      action.__raw = ''
        function()
          require("gitsigns").diffthis("~")
        end
      '';
      options = {
        silent = true;
        desc = "Diff This (~)";
      };
    }

    # Blame
    {
      mode = "n";
      key = "<leader>ghb";
      action.__raw = ''
        function()
          require("gitsigns").blame_line({ full = true })
        end
      '';
      options = {
        silent = true;
        desc = "Blame Line";
      };
    }
    {
      mode = "n";
      key = "<leader>ghB";
      action.__raw = ''
        function()
          require("gitsigns").blame()
        end
      '';
      options = {
        silent = true;
        desc = "Blame Buffer";
      };
    }

    # Navigate hunks
    {
      mode = "n";
      key = "]h";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            require("gitsigns").nav_hunk("next")
          end
        end
      '';
      options = {
        silent = true;
        desc = "Next Hunk";
      };
    }
    {
      mode = "n";
      key = "[h";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            require("gitsigns").nav_hunk("prev")
          end
        end
      '';
      options = {
        silent = true;
        desc = "Prev Hunk";
      };
    }
    {
      mode = "n";
      key = "]H";
      action.__raw = ''
        function()
          require("gitsigns").nav_hunk("last")
        end
      '';
      options = {
        silent = true;
        desc = "Last Hunk";
      };
    }
    {
      mode = "n";
      key = "[H";
      action.__raw = ''
        function()
          require("gitsigns").nav_hunk("first")
        end
      '';
      options = {
        silent = true;
        desc = "First Hunk";
      };
    }
    {
      mode = [
        "o"
        "x"
      ];
      key = "ih";
      action = ":<C-U>Gitsigns select_hunk<CR>";
      options = {
        silent = true;
        desc = "GitSigns Select Hunk";
      };
    }
  ];

  extraConfigLua = ''
    Snacks.toggle({
      name = "Git Signs",
      get = function()
        return require("gitsigns.config").config.signcolumn
      end,
      set = function(state)
        require("gitsigns").toggle_signs(state)
      end,
    }):map("<leader>uG")
  '';
}
