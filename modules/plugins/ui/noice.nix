_: {
  plugins.noice = {
    enable = true;
    settings = {
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
          "cmp.entry.get_documentation" = true;
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
            any = [
              { find = "%d+L, %d+B"; }
              { find = "; after #%d+"; }
              { find = "; before #%d+"; }
            ];
          };
          view = "mini";
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
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
      };
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
