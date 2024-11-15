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
        view = "mini";
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
          "cmp.entry.get_documentation" = true;
        };
      };
      popupmenu = {
        enabled = true;
        backend = "nui";
      };
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
            icon = "";
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
            icon = "󱞪";
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
            icon = "";
            lang = "regex";
          };
        };
      };
    };
  };
}
