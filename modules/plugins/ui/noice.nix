{
  plugins.noice = {
    enable = true;
    settings = {
      notify = {
        enabled = true;
        view = "notify";
      };
      messages = {
        enabled = true;
        view = "notify";
      };
      lsp = {
        message = {
          enabled = true;
        };
        progress = {
          enabled = true;
          view = "mini";
        };
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
        };
      };
      popupmenu = {
        enabled = true;
        backend = "nui";
      };
      routes = [
        {
          filter = {
            event = "msg_show";
            kind = "";
            find = "^[0-9]+ lines [0-9]+ bytes";
          };
          opts = {
            skip = true;
          };
        }
        {
          filter = {
            event = "msg_show";
            kind = "search_count";
          };
          opts = {
            skip = true;
          };
        }
      ];
      cmdline = {
        format = {
          filter = {
            pattern = [
              ":%s*%%s*s:%s*"
              ":%s*%%s*s!%s*"
              ":%s*%%s*s/%s*"
              "%s*s:%s*"
              ":%s*s!%s*"
              ":%s*s/%s*"
            ];
            icon = "󰍉";
            lang = "regex";
          };
          replace = {
            pattern = [
              ":%s*%%s*s:%w*:%s*"
              ":%s*%%s*s!%w*!%s*"
              ":%s*%%s*s/%w*/%s*"
              "%s*s:%w*:%s*"
              ":%s*s!%w*!%s*"
              ":%s*s/%w*/%s*"
            ];
            icon = "󰛔";
            lang = "regex";
          };
          range = {
            pattern = [
              ":%s*%%s*s:%w*:%w*:%s*"
              ":%s*%%s*s!%w*!%w*!%s*"
              ":%s*%%s*s/%w*/%w*/%s*"
              "%s*s:%w*:%w*:%s*"
              ":%s*s!%w*!%w*!%s*"
              ":%s*s/%w*/%w*/%s*"
            ];
            icon = "󱇨";
            lang = "regex";
          };
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>sn";
      action = "";
      options.desc = "+noice";
    }
    {
      mode = "c";
      key = "<S-Enter>";
      action = ''<cmd>lua require("noice").redirect(vim.fn.getcmdline())<cr>'';
      options.desc = "Redirect Cmdline";
    }
    {
      mode = "n";
      key = "<leader>snl";
      action = ''<cmd>lua require("noice").cmd("last")<cr>'';
      options.desc = "Noice Last Message";
    }
    {
      mode = "n";
      key = "<leader>snh";
      action = ''<cmd>lua require("noice").cmd("history")<cr>'';
      options.desc = "Noice History";
    }
    {
      mode = "n";
      key = "<leader>sna";
      action = ''<cmd>lua require("noice").cmd("all")<cr>'';
      options.desc = "Noice All";
    }
    {
      mode = "n";
      key = "<leader>snd";
      action = ''<cmd>lua require("noice").cmd("dismiss")<cr>'';
      options.desc = "Dismiss All";
    }
    {
      mode = "n";
      key = "<leader>snt";
      action = ''<cmd>lua require("noice").cmd("pick")<cr>'';
      options.desc = "Noice Picker (Telescope/FzfLua)";
    }
    {
      mode = [
        "i"
        "n"
        "s"
      ];
      key = "<C-f>";
      action.__raw = ''
        function()
          if not require("noice.lsp").scroll(4) then
            return "<C-f>"
          end
        end
      '';
      options = {
        desc = "Scroll Forward";
        expr = true;
        silent = true;
      };
    }
    {
      mode = [
        "i"
        "n"
        "s"
      ];
      key = "<C-b>";
      action.__raw = ''
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<C-b>"
          end
        end
      '';
      options = {
        desc = "Scroll Backward";
        expr = true;
        silent = true;
      };
    }
  ];
}
