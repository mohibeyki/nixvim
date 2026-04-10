{
  plugins.snacks = {
    enable = true;
    settings.notifier.enabled = false;
  };

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
              ":%%%%s*s:%s*"
              ":%%%%s*s!%s*"
              ":%%%%s*s/%s*"
              ":s:%s*"
              ":s!%s*"
              ":s/%s*"
            ];
            icon = "󰍉";
            lang = "regex";
          };
          replace = {
            pattern = [
              ":%%%%s*s:%w*:%s*"
              ":%%%%s*s!%w*!%s*"
              ":%%%%s*s/%w*/%s*"
              ":s:%w*:%s*"
              ":s!%w*!%s*"
              ":s/%w*/%s*"
            ];
            icon = "󰛔";
            lang = "regex";
          };
          range = {
            pattern = [
              ":%%%%s*s:%w*:%w*:%s*"
              ":%%%%s*s!%w*!%w*!%s*"
              ":%%%%s*s/%w*/%w*/%s*"
              ":s:%w*:%w*:%s*"
              ":s!%w*!%w*!%s*"
              ":s/%w*/%w*/%s*"
            ];
            icon = "󱇨";
            lang = "regex";
          };
        };
      };
    };
  };
}
