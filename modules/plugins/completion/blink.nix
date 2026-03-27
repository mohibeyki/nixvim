{
  plugins.blink-cmp = {
    enable = true;

    settings = {
      keymap = {
        "<C-n>" = [
          "select_next"
          "fallback"
        ];
        "<C-p>" = [
          "select_prev"
          "fallback"
        ];
        "<C-b>" = [
          "scroll_documentation_up"
          "fallback"
        ];
        "<C-f>" = [
          "scroll_documentation_down"
          "fallback"
        ];
        "<C-y>" = [ "select_and_accept" ];
        "<C-Space>" = [
          "show"
          "show_documentation"
          "hide_documentation"
        ];
        "<C-c>" = [
          "hide"
          "fallback"
        ];
      };

      appearance = {
        use_nvim_cmp_as_default = true;
        nerd_font_variant = "mono";
      };

      sources = {
        default = [
          "lsp"
          "path"
          "buffer"
        ];
      };

      completion = {
        accept = {
          auto_brackets = {
            enabled = true;
          };
        };
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 500;
        };
        ghost_text = {
          enabled = true;
        };
      };

      signature = {
        enabled = true;
      };
    };
  };
}
