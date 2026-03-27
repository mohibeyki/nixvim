{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;

    modules = {
      # Bracket navigation (next/prev bracket pair, etc.)
      bracketed = { };

      # Hex color highlighting
      hipatterns = {
        highlighters = {
          hex_color.__raw = ''
            require("mini.hipatterns").gen_highlighter.hex_color()
          '';
        };
      };

      # Icon provider (mock nvim-web-devicons)
      icons = { };

      # Surround text objects (gsa, gsd, gsr, etc.)
      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
          update_n_lines = "gsn";
        };
      };
    };
  };
}
