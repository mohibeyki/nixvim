_: {
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        separator_style = "thin";
        diagnostics = "nvim_lsp";
        always_show_bufferline = false;
        close_command.__raw = ''
          function(n)
            Snacks.bufdelete(n)
          end
        '';
        right_mouse_command.__raw = ''
          function(n)
            Snacks.bufdelete(n)
          end
        '';
        diagnostics_indicator.__raw = ''
          function(_, _, diag)
            local icons = {
              Error = " ",
              Warn = " ",
              Info = " ",
              Hint = " ",
            }
            local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
            return vim.trim(ret)
          end
        '';
        offsets = [
          {
            filetype = "snacks_layout_box";
          }
        ];
      };
    };
  };
}
