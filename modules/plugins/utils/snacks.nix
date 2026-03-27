{
  plugins.snacks = {
    enable = true;
    settings = {
      # Better buffer deletion (replaces mini.bufremove)
      bufdelete = {
        enabled = true;
      };

      # Indentation guides (replaces mini.indentscope)
      indent = {
        enabled = true;
        indent = {
          char = "│";
        };
        scope = {
          enabled = true;
          char = "╎";
        };
      };

      # Dashboard/startup screen (replaces mini.starter)
      dashboard = {
        enabled = true;
        preset = {
          keys = [
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action = "<cmd>lua Snacks.picker.files()<cr>";
            }
            {
              icon = " ";
              key = "n";
              desc = "New File";
              action = ":ene | startinsert";
            }
            {
              icon = " ";
              key = "g";
              desc = "Find Text";
              action = "<cmd>lua Snacks.picker.grep()<cr>";
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = "<cmd>lua Snacks.picker.recent()<cr>";
            }
            {
              icon = " ";
              key = "c";
              desc = "Config";
              action = "<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })<cr>";
            }
            {
              icon = "  ";
              key = "s";
              desc = "Restore Session";
              action.__raw = ''
                function()
                  require("persistence").load()
                end
              '';
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];
        };
        sections = [
          { section = "header"; }
          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
        ];
      };

      # Session management (replaces mini.sessions)
      picker = {
        enabled = true;
      };

      # Notifications
      notifier = {
        enabled = true;
        timeout = 3000;
      };

      # Better input UI
      input = {
        enabled = true;
      };

      # Better scrolling
      scroll = {
        enabled = true;
      };

      # File explorer (replaces oil.nvim)
      explorer = {
        enabled = true;
      };

      # Quickfix
      quickfile = {
        enabled = true;
      };

      # Statuscolumn (custom statusline with git signs, folds, etc)
      statuscolumn = {
        enabled = true;
        left = [
          "mark"
          "sign"
          "fold"
          "git"
        ];
        right = [
          "line"
          "relativenumber"
        ];
      };
    };
  };

  # Keymaps for snacks
  keymaps = [
    # File Explorer
    {
      mode = "n";
      key = "-";
      action = "<cmd>lua Snacks.explorer.open()<CR>";
      options = {
        desc = "Open File Explorer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua Snacks.explorer.open()<CR>";
      options = {
        desc = "File Explorer";
        silent = true;
      };
    }

    # Find files
    {
      mode = "n";
      key = "<leader><space>";
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options = {
        desc = "Find Files (Root Dir)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options = {
        desc = "Find Files (Root Dir)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fF";
      action.__raw = ''
        function()
          Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") })
        end
      '';
      options = {
        desc = "Find Files (cwd)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>lua Snacks.picker.recent()<CR>";
      options = {
        desc = "Recent Files";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fR";
      action.__raw = ''
        function()
          Snacks.picker.recent({ cwd = vim.fn.expand("%:p:h") })
        end
      '';
      options = {
        desc = "Recent Files (cwd)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })<CR>";
      options = {
        desc = "Find Config File";
        silent = true;
      };
    }

    # Search/Grep
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options = {
        desc = "Grep (Root Dir)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>sg";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options = {
        desc = "Grep (Root Dir)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>sG";
      action.__raw = ''
        function()
          Snacks.picker.grep({ cwd = vim.fn.expand("%:p:h") })
        end
      '';
      options = {
        desc = "Grep (cwd)";
        silent = true;
      };
    }

    # Buffers
    {
      mode = "n";
      key = "<leader>,";
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options = {
        desc = "Buffers";
        silent = true;
      };
    }

    # Command history
    {
      mode = "n";
      key = "<leader>:";
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
      options = {
        desc = "Command History";
        silent = true;
      };
    }

    # Notifications
    {
      mode = "n";
      key = "<leader>un";
      action = "<cmd>lua Snacks.picker.notifications()<CR>";
      options = {
        desc = "Notification History";
        silent = true;
      };
    }
  ];
}
